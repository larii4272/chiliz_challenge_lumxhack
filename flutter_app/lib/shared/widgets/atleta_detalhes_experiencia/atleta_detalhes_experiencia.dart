import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';

class AtletaDetalhesExperienciaWidget extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String image;

  const AtletaDetalhesExperienciaWidget(
      {super.key,
      required this.titulo,
      required this.descricao,
      required this.image});

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
          Container(
            color: AppColors.primary.withOpacity(0.1),
            child: Image.network(image),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              titulo,
              style: ExperienceBannerTextStyles.title,
            ),
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
