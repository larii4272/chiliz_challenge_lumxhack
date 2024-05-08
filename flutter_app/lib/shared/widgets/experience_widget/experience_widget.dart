import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';

class ExperienceWidget extends StatelessWidget {
  final String text;
  const ExperienceWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: ExperienceBannerTextStyles.experience,
          ),
          Image.asset(
            "assets/images/lock.png",
            width: 25,
            height: 25,
          ),
        ],
      ),
    );
  }
}
