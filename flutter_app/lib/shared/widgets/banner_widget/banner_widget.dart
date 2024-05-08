import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 75,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primary,
              AppColors.primary,
              AppColors.primary,
              AppColors.secondary,
              AppColors.primary
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Text.rich(
                TextSpan(
                  text: "Apoie atletas olímpicos e desbloqueie experiências",
                  children: [
                    TextSpan(
                      text: " Olyx ",
                      style: PageBannerTextStyles.logoClara,
                    ),
                    TextSpan(
                      text: "exclusivas!",
                      style: PageBannerTextStyles.textClaro,
                    ),
                  ],
                ),
                style: PageBannerTextStyles.textClaro,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
