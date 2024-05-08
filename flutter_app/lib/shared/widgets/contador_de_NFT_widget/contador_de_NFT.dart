import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';

class ContadorDeNFTWidget extends StatelessWidget {
  final int quantidade;
  const ContadorDeNFTWidget({super.key, required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 300,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.primary, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 260,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "${quantidade.toString()}\n",
                      children: [
                        TextSpan(
                          text: "Seus NFTs",
                          style: PageBannerTextStyles.textEscuro,
                        ),
                        TextSpan(
                          text: " Olyx ",
                          style: PageBannerTextStyles.logoRoxa,
                        ),
                      ],
                    ),
                    style: AppTextStyles.contador,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(onPressed: () {}, text: "Acessar"),
            ],
          ),
        ),
      ),
    );
  }
}
