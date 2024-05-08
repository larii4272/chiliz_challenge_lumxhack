import 'package:flutter/material.dart';
import 'package:flutter_app/api/experiencias/get/get_experiencias.dart';
import 'package:flutter_app/pages/atleta_detalhes/atleta_detalhes.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/atleta_card_widget/atleta_card_widget.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';
import 'package:flutter_app/shared/widgets/experience_widget/experience_widget.dart';

class CardExperienceAtletaWidget extends StatefulWidget {
  final int id;
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
      required this.bio,
      required this.id});

  @override
  State<CardExperienceAtletaWidget> createState() =>
      _CardExperienceAtletaWidgetState();
}

class _CardExperienceAtletaWidgetState
    extends State<CardExperienceAtletaWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetExperiencias.fetch(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List teste = snapshot.data!
              .where((element) => element['athlete'] as int == widget.id)
              .toList();

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
                  flagId: widget.flagId,
                  imageDoAtleta: widget.imageDoAtleta,
                  tags: widget.tags,
                  nomeDoAtleta: widget.nomeDoAtleta,
                  bio: widget.bio,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Experiências exclusivas",
                    style: ExperienceBannerTextStyles.title,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < teste.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ExperienceWidget(
                          text: teste[i]['experienceName'],
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  child: ButtonWidget(
                    text: 'Acessar experiências',
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              AtletaDetalhesPage(idAtleta: widget.id),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
