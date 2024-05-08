import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';
import 'package:flutter_app/shared/widgets/flag_widget/flag_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  final String flagId;
  final String imageDoAtleta;
  final String nomeDoAtleta;
  final String titulo;
  const ExperienceCardWidget({
    super.key,
    required this.flagId,
    required this.imageDoAtleta,
    required this.nomeDoAtleta,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 475,
      height: 230,
      decoration: BoxDecoration(
        color: const Color(0xff40329C).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.only(right: 50),
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
                child: Image.asset(
                  'assets/images/lock.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 475 * 0.6,
                  child: Text(
                    titulo,
                    style: ExperienceBannerTextStyles.title2,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: FlagWidget(flagId: flagId),
                  title: Text(
                    nomeDoAtleta,
                    style: ExperienceBannerTextStyles.atleta2,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: ButtonWidget(
                    onPressed: () {},
                    text: "Desbloquear",
                  ),
                ),
                SizedBox(height: 5)
              ],
            )
          ],
        ),
      ),
    );
  }
}
