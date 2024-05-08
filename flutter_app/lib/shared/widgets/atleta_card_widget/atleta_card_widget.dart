// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/flag_widget/flag_widget.dart';

class AtletaCardWidget extends StatelessWidget {
  final String flagId;
  final String imageDoAtleta;
  final List<String> tags;
  final String nomeDoAtleta;
  final String bio;
  const AtletaCardWidget({
    Key? key,
    required this.flagId,
    required this.imageDoAtleta,
    required this.tags,
    required this.nomeDoAtleta,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 475,
      height: 230,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Image.asset(
                  "assets/images/backgound_atleta.png",
                  width: 233,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.network(
                imageDoAtleta,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: FlagWidget(flagId: flagId),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    for (int i = 0; i < tags.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              tags[i],
                              style: ExperienceBannerTextStyles.tags,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nomeDoAtleta,
                      style: ExperienceBannerTextStyles.atleta,
                    ),
                    SizedBox(
                      width: 470 / 2,
                      child: Text(
                        bio,
                        style: ExperienceBannerTextStyles.description,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
