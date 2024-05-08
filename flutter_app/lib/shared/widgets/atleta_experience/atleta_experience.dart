import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/atleta_card_widget/atleta_card_widget.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';
import 'package:flutter_app/shared/widgets/experience_widget/experience_widget.dart';

class CardExperienceAtletaWidget extends StatelessWidget {
  final String flagId;
  final String imageDoAtleta;
  final List<String> tags;
  final String nomeDoAtleta;
  final String bio;
  const CardExperienceAtletaWidget(
      {super.key,
      required this.flagId,
      required this.imageDoAtleta,
      required this.tags,
      required this.nomeDoAtleta,
      required this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 475,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AtletaCardWidget(
            flagId: flagId,
            imageDoAtleta: imageDoAtleta,
            tags: tags,
            nomeDoAtleta: nomeDoAtleta,
            bio: bio,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Experiências exclusivas",
              style: ExperienceBannerTextStyles.title,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExperienceWidget(text: 'Masterclass Alimentação Campeã'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ExperienceWidget(
                  text: 'NFT\nSurpresa!',
                ),
              ),
              ExperienceWidget(text: 'Treino com\na Medalhista'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
            child: ButtonWidget(
              text: 'Acessar experiências',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
