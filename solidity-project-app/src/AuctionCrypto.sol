// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/*
 _____                  _        _____            _                      _____ _   __   __
/  __ \                | |      |  __ \          (_)                    |  _  | |  \ \ / /
| /  \/_ __ _   _ _ __ | |_ ___ | |  \/ ___ _ __  _ _   _ ___   ______  | | | | |   \ V / 
| |   | '__| | | | '_ \| __/ _ \| | __ / _ \ '_ \| | | | / __| |______| | | | | |    \ /  
| \__/\ |  | |_| | |_) | || (_) | |_\ \  __/ | | | | |_| \__ \          \ \_/ / |____| |  
 \____/_|   \__, | .__/ \__\___/ \____/\___|_| |_|_|\__,_|___/           \___/\_____/\_/  
             __/ | |                                                                      
            |___/|_|                                                                                                                  
*/

contract AuctionCrypto is ERC721URIStorage {
    using SafeMath for uint256;

    address public owner;
    uint256 public totalSupply;
    uint256 private totalToken;
    uint256 private totalAuction;
    uint256 private constant PERCENTAGE_DIVISOR = 100;
    uint256 public constant OWNER_FEE_PERC = 5;

    struct AuctionItem {
        uint256 itemId;
        string name;
        string metadata;
        address owner;
        uint256 startPrice;
        uint256 highestBid;
        address highestBidder;
        uint256 endTime;
        bool ended;
    }

    struct Token {
        uint256 tokenId;
        string name;
        uint256 initValue;
        string metadata;
        bool available;
        uint256 dateCheckIn;
    }

    mapping(uint256 => AuctionItem) public auctions;
    mapping(uint256 => Token) public tokensCreated;

    event NewAuction(uint256 indexed itemId, address indexed owner, string name, uint256 startPrice, uint256 endTime);
    event NewToken(uint256 indexed tokenId);
    event NewBid(uint256 indexed itemId, address indexed bidder, uint256 amount);
    event AuctionEnded(uint256 indexed itemId, address indexed winner, uint256 amount);
    event TokenPurchased(address indexed buyer, uint256 indexed tokenId, uint256 amount);
    event Withdraw(address to, uint256 amount);

    constructor() ERC721("Auction Crypto", "AUC") {
        owner = msg.sender;
    }

    function withdraw() public {
        payable(owner).transfer(address(this).balance);
        emit Withdraw(owner, address(this).balance);
    }

    function createAuction(string memory metadata, string memory name, 
        uint256 startPrice, uint256 duration) public {

        uint256 itemId = totalSupply;
        string memory tokenURI = metadata;

        auctions[itemId] = AuctionItem({
            itemId: itemId,
            name: name,
            metadata: tokenURI,
            owner: msg.sender,
            startPrice: startPrice,
            highestBid: startPrice,
            highestBidder: address(0),
            endTime: block.timestamp.add(duration),
            ended: false
        });

        _mint(msg.sender, itemId);
        _setTokenURI(itemId, tokenURI);
        totalSupply++;
        totalAuction++;
        emit NewAuction(itemId, msg.sender, name, startPrice, auctions[itemId].endTime);
    }

    function bid(uint256 itemId) public payable {
        require(msg.value > auctions[itemId].highestBid, "Bid must be higher than current highest bid");

        if (auctions[itemId].highestBidder != address(0)) {
            payable(auctions[itemId].highestBidder).transfer(auctions[itemId].highestBid);
        }

        auctions[itemId].highestBid = msg.value;
        auctions[itemId].highestBidder = msg.sender;

        emit NewBid(itemId, msg.sender, msg.value);
    }

    function endAuction(uint256 itemId) public {
        require(!auctions[itemId].ended, "Auction has already ended");

        auctions[itemId].ended = true;

        uint256 contractFee = (auctions[itemId].highestBid * OWNER_FEE_PERC) / PERCENTAGE_DIVISOR;
        uint256 ownerFee = auctions[itemId].highestBid - contractFee;

        if (auctions[itemId].highestBidder != address(0)) {
            payable(auctions[itemId].owner).transfer(ownerFee);
            emit AuctionEnded(itemId, auctions[itemId].highestBidder, auctions[itemId].highestBid);
        } else {
            emit AuctionEnded(itemId, address(0), 0);
        }
    }

    function getAllAuctions() public view returns (AuctionItem[] memory) {
        AuctionItem[] memory allTokens = new AuctionItem[](totalAuction);

        if (totalAuction > 0) {
            uint16 j = 0;
            for (uint16 i = 0; i <= totalSupply - 1; i++) {
                string memory name = auctions[i].name;

                if (bytes(name).length != 0) {
                    allTokens[j] = auctions[i];
                    j++;
                }
            }
        }

        return allTokens;
    }

    function getOwnerAuction(address _walletAddress) public view returns (AuctionItem[] memory) {
        uint256 totalOwner = balanceOf(_walletAddress);
        AuctionItem[] memory allTokens = new AuctionItem[](totalOwner);

        if (totalOwner > 0) {
            uint16 j = 0;
            for (uint16 i = 0; i <= totalSupply - 1; i++) {
                address walletFound = ownerOf(auctions[i].itemId);

                if (walletFound == _walletAddress) {
                    allTokens[j] = auctions[i];
                    j++;
                }
            }
        }
        return allTokens;
    }

    function createToken(string memory metadata, string memory name, 
        uint256 initValue, uint256 tokenId) public {

        uint256 newTokenId = tokenId;
        string memory tokenURI = metadata;

        tokensCreated[newTokenId] = Token(newTokenId, name, initValue, tokenURI, true, 0);

        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        totalSupply++;
        totalToken++;
        emit NewToken(newTokenId);
    }

    function purchaseToken(uint256 tokenId) public payable {
        require(tokensCreated[tokenId].available, "Token not available");

        // Calculate contract Fee
        uint256 contractFee = (msg.value * OWNER_FEE_PERC) / PERCENTAGE_DIVISOR;
        uint256 ownerFee = msg.value - contractFee;

        payable(ownerOf(tokenId)).transfer(ownerFee);

        // Transfer token to buyer
        _transfer(ownerOf(tokenId), msg.sender, tokenId);

        tokensCreated[tokenId].dateCheckIn = block.timestamp;
        tokensCreated[tokenId].initValue = msg.value;

        emit TokenPurchased(msg.sender, tokenId, msg.value);
    }

    function getAllTokens() public view returns (Token[] memory) {
        Token[] memory allTokens = new Token[](totalToken);

        if (totalToken > 0) {
            uint16 j = 0;
            for (uint16 i = 0; i <= totalSupply - 1; i++) {
                string memory name = tokensCreated[i].name;

                if (bytes(name).length != 0) {
                    allTokens[j] = tokensCreated[i];
                    j++;
                }
            }
        }

        return allTokens;
    }

    function getOwnerTokens(address _walletAddress) public view returns (Token[] memory) {
        uint256 totalOwner = balanceOf(_walletAddress);
        Token[] memory allTokens = new Token[](totalOwner);

        if (totalOwner > 0) {
            uint16 j = 0;
            for (uint16 i = 0; i <= totalSupply - 1; i++) {
                address walletFound = ownerOf(tokensCreated[i].tokenId);

                if (walletFound == _walletAddress) {
                    allTokens[j] = tokensCreated[i];
                    j++;
                }
            }
        }
        return allTokens;
    }
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
}
