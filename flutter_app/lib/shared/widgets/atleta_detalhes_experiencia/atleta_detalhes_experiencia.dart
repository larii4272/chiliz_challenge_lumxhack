import 'package:flutter/material.dart';
import 'package:flutter_app/api/transaction/post/post_transaction.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/button_widget/button_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class AtletaDetalhesExperienciaWidget extends StatelessWidget {
  final String titulo;
  final int tokenId;
  final String descricao;
  final String image;
  final double valor;

  const AtletaDetalhesExperienciaWidget({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.image,
    required this.valor,
    required this.tokenId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
            width: double.maxFinite,
            height: 180,
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              descricao,
              style: GoogleFonts.inter(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ButtonWidget(
              text: 'Acessar experiências',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                        width: 400,
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${valor}",
                                  style: ExperienceBannerTextStyles.title,
                                ),
                                Text(
                                  "ETH",
                                  style: ExperienceBannerTextStyles.title,
                                ),
                              ],
                            ),
                            ButtonWidget(
                              onPressed: () async {
                                await PostTransaction.post(tokenId);
                                Navigator.pop(context);
                              },
                              text: "Confirmar transacao",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
