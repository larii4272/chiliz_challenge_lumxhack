import 'package:flutter/material.dart';
import 'package:flutter_app/api/atleta/get/get_atletas.dart';
import 'package:flutter_app/api/experiencias/get/get_experiencias.dart';
import 'package:flutter_app/pages/atletas_page/atletas_page.dart';
import 'package:flutter_app/pages/home_page/home_page.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/atleta_bio_widget/atleta_bio_widget.dart';
import 'package:flutter_app/shared/widgets/atleta_detalhes_experiencia/atleta_detalhes_experiencia.dart';
import 'package:flutter_app/shared/widgets/banner_widget/banner_widget.dart';
import 'package:flutter_app/shared/widgets/tab_title_widget/tab_title_widget.dart';

class AtletaDetalhesPage extends StatefulWidget {
  final int idAtleta;
  const AtletaDetalhesPage({super.key, required this.idAtleta});

  @override
  State<AtletaDetalhesPage> createState() => _AtletaDetalhesPageState();
}

class _AtletaDetalhesPageState extends State<AtletaDetalhesPage> {
  double width = 0;
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leadingWidth: 200,
        leading: Center(
          child: Text(
            "Oly",
            style: AppTextStyles.logo,
          ),
        ),
        actions: [
          TabTittleWidget(
            title: "Home",
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const HomePage(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          ),
          TabTittleWidget(
            title: "Atletas",
            isOnPage: true,
            onTap: () {},
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: width >= 1600 ? 1600 : width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: BannerWidget(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const AtletasPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: const SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text("Voltar"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  FutureBuilder(
                    future: Future.wait(
                      [
                        GetAtletas.fetch()!,
                        GetExperiencias.fetch()!,
                      ],
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final atleta = (snapshot.data!.first
                              .where(
                                (element) =>
                                    element['id'] as int == widget.idAtleta,
                              )
                              .toList())
                          .first;
                      print(snapshot.data!.first);

                      final List NFTs = (snapshot.data!.last
                          .where(
                            (element) =>
                                element['athlete'] as int == widget.idAtleta,
                          )
                          .toList());
                      return Wrap(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 400,
                            child: AtletaBioWidget(
                              nomeDoAtleta: atleta['athleteName'],
                              flagId: atleta['flag'],
                              modalidade: "Wrestling",
                              imageDoAtleta: atleta['imageUrl'],
                              bio: atleta['description'],
                            ),
                          ),
                          for (int i = 0; i < NFTs.length; i++)
                            AtletaDetalhesExperienciaWidget(
                              valor: NFTs[i]['price'],
                              titulo: NFTs[i]['experienceName'],
                              descricao: NFTs[i]['description'],
                              image: NFTs[i]['imageUrl'],
                              tokenId: NFTs[i]['id'],
                            )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
