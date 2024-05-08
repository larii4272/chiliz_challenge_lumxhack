from rest_framework.serializers import ModelSerializer
from .models import CustomUser, Wallet, Contract, Athlete, Experience, SolidityToken, LumxToken


class AthleteSerializer(ModelSerializer):
    class Meta:
        model = Athlete
        fields = '__all__'

class ExperienceSerializer(ModelSerializer):
    class Meta:
        model = Experience
        fields = '__all__'

class LumxTokenSerializer(ModelSerializer):
    class Meta:
        model = LumxToken
        fields = '__all__'

class SolidityTokenSerializer(ModelSerializer):
    class Meta:
        model = SolidityToken
        fields = '__all__'

class WalletSerializer(ModelSerializer):
    class Meta:
        model = Wallet
        fields = ['walletTokens']

class SoliditTokenSerializer(ModelSerializer):
    class Meta:
        model = SolidityToken
        fields = '__all__'