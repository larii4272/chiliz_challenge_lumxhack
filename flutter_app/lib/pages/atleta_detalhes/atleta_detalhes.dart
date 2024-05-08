import 'package:flutter/material.dart';
import 'package:flutter_app/pages/atletas_page/atletas_page.dart';
import 'package:flutter_app/pages/home_page/home_page.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/atleta_bio_widget/atleta_bio_widget.dart';
import 'package:flutter_app/shared/widgets/atleta_detalhes_experiencia/atleta_detalhes_experiencia.dart';
import 'package:flutter_app/shared/widgets/banner_widget/banner_widget.dart';
import 'package:flutter_app/shared/widgets/tab_title_widget/tab_title_widget.dart';

class AtletaDetalhesPage extends StatefulWidget {
  const AtletaDetalhesPage({super.key});

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
                  const Wrap(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 400,
                        child: AtletaBioWidget(
                          nomeDoAtleta: "dados['athleteName']",
                          flagId: "BR",
                          modalidade: "Wrestling",
                          imageDoAtleta:
                              'https://lh3.googleusercontent.com/fife/ALs6j_FPOsrJ1tcDfjRG8-jyhoTYsEVsMOKMZFPiNlO7Sb9bfPCmi1H-XzbpcQCoxNUdkktvzPNRIDvz5EGdkq-WjnJEqsZgwetSYP7NNhndTwzcy6N-5g8JakTZJsCox90AHsvwDHoTDIXb2XHsuvlMJHLLw_tmGFgd7ZTWUI0KvwgrVbCSxaZgWTfwOC61oLd2UjPOqoKopMyxNV0PeYR1Xk01QW3QkZZn-pQ7rahPyfo9cMrZp3HCsCN2R4ON748p_PlmO9j5FgZO7Rocl_0FbLW9gSK3c_ZE8ZtgTEwut52tGwsemlODakkiaByQDK03FIxLITZsokSly3os56fJYuGtus_6eKS9UtQVJRhWsMe8LHRK6aVlqUMOFVhdLioy3ctFOeA51ZrglBuvW1VZZWwBLLqtYQBJr4x0uvj4i_cGabqZW-O7AfHW29jdgJV9o0mrti8gmEQLyxkPQEseWY-Tro9cHFHhVtsEB5TMERFH6Fndj2s9FbaPb2CtG14gYLNaHY1BJ08ddrFMt9Cao8o4JhcERyguDf71klb8gekrYffIN-_9KviRU68RoDplzcjy9j2xtB27cNFbKHWzYNHbBzq6QuM0Okr1DRQtYiFcy6YJ-ADsWugwwAlmDOUHJpqSnm-twFN3mHBWOT3Y6tqhicZcxh0xM5n5HEaf7_MyeFUfbEakJrqTKuuTwuhuI9Tf8wX8fL8JmEPfFbh4s-ht7ti3LQ5YrvvRcDcTrvKtOEGHPGcvTcvIwK0qSVzvWyj2fWrfSkehzQ2v1eiEO0rPOm4ijPHuppBUl209Wv8Ic7bGBDYw13scCAp9EmY9WAobjdJB6OjJ0P0ctE-wG5QONGYIXGqFDo0dvnkCxwsoo8uwjvCi_CW7iAKPgxuOsOq8WzO0iwzKePbCVMwcopZms1fhOH8Zfwy1c-AjU2jscow4ljpe_qGvdTjKlv_0aGRh0uhWbs-yoETEj-T0aHjSEkpuuER15ZvLk44OYyXeUnt6DOBOn3LQZstuKF9twMdzrWS1nLN1xuNWrcRGcLQcKxl-0Lu4aLkf3oS3d9XVAaVosKWZqiiunMxNJoiiO3eH5SwIjqSkxrF2IFFf5mZUw04ILZJOQScdKhFZE9VTxDEguq2gRyQlwPnCBOPP1dbdq62S74k8RzVBXaltokWzm7v5lRByv_SFqujBg2DVKfNaCmfNzh2OFXSml2jfk67HwesHZIP39rXlFDbqIfnVjhXE1EpIR3NgnC8M3z2Z2MTe-w6IbKl-2rYL5Tv4t-2IDTsAFhrLw8l6SMVqPbm-HPBrphdVdeCWh0vfOd7lPRFRv7OMyxN5qCf64VnXT6MU7saOKvO4L4IhVUMSWwVd7PcE34D2kicSMPEBeDZ9Y5JUwE3_nKKYW5bFFF0WeP2BilBcAs8H1ycbqSQwkt3W6ZMMV4jCXE9_Z1ZVFD8G1cuGqrYTVx0b_M5I1tmvEwGzJmt7C2DeuswxuXC7Dn5MVqc98TAo80bb9pGX6Nu_7a4942tn0j4VwDrgXqnXqrCnmYJRwdKn6HJk_MuQsBvXp-wIBoU5oCk627lhaHkFHW9y3Y8QGRsboDQluf72_XRokoIDRJMT6ULXxA=w1167-h907',
                          bio:
                              'Conquista histórica!\nPrimeira medalhista brasileira em mundiais de wrestling.',
                        ),
                      ),
                      AtletaDetalhesExperienciaWidget(
                        titulo: "Treino com a Medalhista",
                        descricao:
                            "1 hora de treino musculação ou treino wrestling",
                        image:
                            'https://lh3.googleusercontent.com/fife/ALs6j_FPOsrJ1tcDfjRG8-jyhoTYsEVsMOKMZFPiNlO7Sb9bfPCmi1H-XzbpcQCoxNUdkktvzPNRIDvz5EGdkq-WjnJEqsZgwetSYP7NNhndTwzcy6N-5g8JakTZJsCox90AHsvwDHoTDIXb2XHsuvlMJHLLw_tmGFgd7ZTWUI0KvwgrVbCSxaZgWTfwOC61oLd2UjPOqoKopMyxNV0PeYR1Xk01QW3QkZZn-pQ7rahPyfo9cMrZp3HCsCN2R4ON748p_PlmO9j5FgZO7Rocl_0FbLW9gSK3c_ZE8ZtgTEwut52tGwsemlODakkiaByQDK03FIxLITZsokSly3os56fJYuGtus_6eKS9UtQVJRhWsMe8LHRK6aVlqUMOFVhdLioy3ctFOeA51ZrglBuvW1VZZWwBLLqtYQBJr4x0uvj4i_cGabqZW-O7AfHW29jdgJV9o0mrti8gmEQLyxkPQEseWY-Tro9cHFHhVtsEB5TMERFH6Fndj2s9FbaPb2CtG14gYLNaHY1BJ08ddrFMt9Cao8o4JhcERyguDf71klb8gekrYffIN-_9KviRU68RoDplzcjy9j2xtB27cNFbKHWzYNHbBzq6QuM0Okr1DRQtYiFcy6YJ-ADsWugwwAlmDOUHJpqSnm-twFN3mHBWOT3Y6tqhicZcxh0xM5n5HEaf7_MyeFUfbEakJrqTKuuTwuhuI9Tf8wX8fL8JmEPfFbh4s-ht7ti3LQ5YrvvRcDcTrvKtOEGHPGcvTcvIwK0qSVzvWyj2fWrfSkehzQ2v1eiEO0rPOm4ijPHuppBUl209Wv8Ic7bGBDYw13scCAp9EmY9WAobjdJB6OjJ0P0ctE-wG5QONGYIXGqFDo0dvnkCxwsoo8uwjvCi_CW7iAKPgxuOsOq8WzO0iwzKePbCVMwcopZms1fhOH8Zfwy1c-AjU2jscow4ljpe_qGvdTjKlv_0aGRh0uhWbs-yoETEj-T0aHjSEkpuuER15ZvLk44OYyXeUnt6DOBOn3LQZstuKF9twMdzrWS1nLN1xuNWrcRGcLQcKxl-0Lu4aLkf3oS3d9XVAaVosKWZqiiunMxNJoiiO3eH5SwIjqSkxrF2IFFf5mZUw04ILZJOQScdKhFZE9VTxDEguq2gRyQlwPnCBOPP1dbdq62S74k8RzVBXaltokWzm7v5lRByv_SFqujBg2DVKfNaCmfNzh2OFXSml2jfk67HwesHZIP39rXlFDbqIfnVjhXE1EpIR3NgnC8M3z2Z2MTe-w6IbKl-2rYL5Tv4t-2IDTsAFhrLw8l6SMVqPbm-HPBrphdVdeCWh0vfOd7lPRFRv7OMyxN5qCf64VnXT6MU7saOKvO4L4IhVUMSWwVd7PcE34D2kicSMPEBeDZ9Y5JUwE3_nKKYW5bFFF0WeP2BilBcAs8H1ycbqSQwkt3W6ZMMV4jCXE9_Z1ZVFD8G1cuGqrYTVx0b_M5I1tmvEwGzJmt7C2DeuswxuXC7Dn5MVqc98TAo80bb9pGX6Nu_7a4942tn0j4VwDrgXqnXqrCnmYJRwdKn6HJk_MuQsBvXp-wIBoU5oCk627lhaHkFHW9y3Y8QGRsboDQluf72_XRokoIDRJMT6ULXxA=w1167-h907',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
