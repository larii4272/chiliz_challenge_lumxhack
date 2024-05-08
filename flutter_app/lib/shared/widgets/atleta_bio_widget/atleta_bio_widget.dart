// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/flag_widget/flag_widget.dart';

class AtletaBioWidget extends StatelessWidget {
  final String flagId;
  final String imageDoAtleta;
  final String modalidade;
  final String nomeDoAtleta;
  final String bio;

  const AtletaBioWidget({
    Key? key,
    required this.imageDoAtleta,
    required this.flagId,
    required this.modalidade,
    required this.nomeDoAtleta,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: 0.85,
                    child: Image.network(
                      imageDoAtleta,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Text("#$modalidade"),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: FlagWidget(flagId: flagId),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            nomeDoAtleta,
            style: ExperienceBannerTextStyles.atleta,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 470 / 2,
            child: Text(
              bio,
              style: ExperienceBannerTextStyles.description,
            ),
          ),
        ],
      ),
    );
  }
}
