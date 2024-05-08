import 'package:flutter/material.dart';
import 'package:flutter_app/pages/atletas_page/atletas_page.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/banner_widget/banner_widget.dart';
import 'package:flutter_app/shared/widgets/contador_de_NFT_widget/contador_de_NFT.dart';
import 'package:flutter_app/shared/widgets/experience_card_widget/experience_card_widget.dart';
import 'package:flutter_app/shared/widgets/tab_title_widget/tab_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Text("Oly", style: AppTextStyles.logo),
        ),
        actions: [
          TabTittleWidget(
            title: "Home",
            isOnPage: true,
            onTap: () {},
          ),
          TabTittleWidget(
            title: "Atletas",
            onTap: () {
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
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: width >= 1600 ? 1600 : width,
          child: Column(
            children: [
              const BannerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContadorDeNFTWidget(quantidade: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Desbloqueie experiências exclusivas",
                            style: AppTextStyles.title,
                          ),
                          const Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ExperienceCardWidget(
                                nomeDoAtleta: "Aline Silva",
                                titulo: "Treino com medalhista de wrestling",
                                flagId: "BR",
                                imageDoAtleta:
                                    'https://lh3.googleusercontent.com/fife/ALs6j_FPOsrJ1tcDfjRG8-jyhoTYsEVsMOKMZFPiNlO7Sb9bfPCmi1H-XzbpcQCoxNUdkktvzPNRIDvz5EGdkq-WjnJEqsZgwetSYP7NNhndTwzcy6N-5g8JakTZJsCox90AHsvwDHoTDIXb2XHsuvlMJHLLw_tmGFgd7ZTWUI0KvwgrVbCSxaZgWTfwOC61oLd2UjPOqoKopMyxNV0PeYR1Xk01QW3QkZZn-pQ7rahPyfo9cMrZp3HCsCN2R4ON748p_PlmO9j5FgZO7Rocl_0FbLW9gSK3c_ZE8ZtgTEwut52tGwsemlODakkiaByQDK03FIxLITZsokSly3os56fJYuGtus_6eKS9UtQVJRhWsMe8LHRK6aVlqUMOFVhdLioy3ctFOeA51ZrglBuvW1VZZWwBLLqtYQBJr4x0uvj4i_cGabqZW-O7AfHW29jdgJV9o0mrti8gmEQLyxkPQEseWY-Tro9cHFHhVtsEB5TMERFH6Fndj2s9FbaPb2CtG14gYLNaHY1BJ08ddrFMt9Cao8o4JhcERyguDf71klb8gekrYffIN-_9KviRU68RoDplzcjy9j2xtB27cNFbKHWzYNHbBzq6QuM0Okr1DRQtYiFcy6YJ-ADsWugwwAlmDOUHJpqSnm-twFN3mHBWOT3Y6tqhicZcxh0xM5n5HEaf7_MyeFUfbEakJrqTKuuTwuhuI9Tf8wX8fL8JmEPfFbh4s-ht7ti3LQ5YrvvRcDcTrvKtOEGHPGcvTcvIwK0qSVzvWyj2fWrfSkehzQ2v1eiEO0rPOm4ijPHuppBUl209Wv8Ic7bGBDYw13scCAp9EmY9WAobjdJB6OjJ0P0ctE-wG5QONGYIXGqFDo0dvnkCxwsoo8uwjvCi_CW7iAKPgxuOsOq8WzO0iwzKePbCVMwcopZms1fhOH8Zfwy1c-AjU2jscow4ljpe_qGvdTjKlv_0aGRh0uhWbs-yoETEj-T0aHjSEkpuuER15ZvLk44OYyXeUnt6DOBOn3LQZstuKF9twMdzrWS1nLN1xuNWrcRGcLQcKxl-0Lu4aLkf3oS3d9XVAaVosKWZqiiunMxNJoiiO3eH5SwIjqSkxrF2IFFf5mZUw04ILZJOQScdKhFZE9VTxDEguq2gRyQlwPnCBOPP1dbdq62S74k8RzVBXaltokWzm7v5lRByv_SFqujBg2DVKfNaCmfNzh2OFXSml2jfk67HwesHZIP39rXlFDbqIfnVjhXE1EpIR3NgnC8M3z2Z2MTe-w6IbKl-2rYL5Tv4t-2IDTsAFhrLw8l6SMVqPbm-HPBrphdVdeCWh0vfOd7lPRFRv7OMyxN5qCf64VnXT6MU7saOKvO4L4IhVUMSWwVd7PcE34D2kicSMPEBeDZ9Y5JUwE3_nKKYW5bFFF0WeP2BilBcAs8H1ycbqSQwkt3W6ZMMV4jCXE9_Z1ZVFD8G1cuGqrYTVx0b_M5I1tmvEwGzJmt7C2DeuswxuXC7Dn5MVqc98TAo80bb9pGX6Nu_7a4942tn0j4VwDrgXqnXqrCnmYJRwdKn6HJk_MuQsBvXp-wIBoU5oCk627lhaHkFHW9y3Y8QGRsboDQluf72_XRokoIDRJMT6ULXxA=w1167-h907',
                              ),
                              ExperienceCardWidget(
                                nomeDoAtleta: "Eric Toledo",
                                titulo: "Experiência VIP Levantamento de peso",
                                flagId: "BR",
                                imageDoAtleta:
                                    'https://lh3.googleusercontent.com/fife/ALs6j_Gack5aucdYHy743nxNySlqpFM8GgWb_0Cs3L0hchGDrcnNGVp-Su4ywWuy2Psem6uPk-5pvHx5mFBFfeftm73pvQsSDCqz16pkyJoyi47JVOxde-2KgV2gJ2OE-8wtFOMKVt1Fwt-mYvEWbKEODw71iutyYFlCbthY2si4K_r40R56wZBz6g81EjvrcbtLe4NCFQ8LGAUi70zauMYQrd1TBsrYSpQdRZLgy6M-ukQTGPGJ_jEh_ZdU7XWYxeU1mhr5rc0ENSKUFp-eepnZWE9Q49ClZtfvx7Ks3kisu1oSTzjqk9FDvQiBpu-okpFugji8ILcyTv73p5YgI5EyZpFlwQwVNQL-nfrh3ICzaQou4gACVsowYQYk32XRTivA2I9ZJbdByCK8R2NII4gLjI-ElUdy-il6dsX172NWBy_YeMMJmHFm3GX_4_zuYU7pgMxb54fqUqIoldF3E96TPFk_JYlY2N5BagBL46LuoflbshSY3_olnd2jFMTK0syYXfALb6chCYlKnEoqqq-a22-P3fEYiKhGtvsYmhtX485h63h20GAreBLr1cYdBkBcSmVglnROKrtffhYcGCK46OwfkwHeiSQjm8KNZE27iHzikZywluYgvs1DoVXv0blG8wHhJ66Kq7i83Gkk0HKT8R5CuRAB5DrRRlYY-de9xn_0PZBSad6dqdT7vK-w8kqbre70_FZM1qAkfJ79CpOrKS3RocwuQVIi3I6vi4hYz1J3MilpTQ8rpeFpqAkgLzqtZI8tkh1A-HoD2vgBUcGbcyZRz_Ch8v60U-eAjFzkN4--Va3h-i7C-d1Ehxq0Tr-GycyZDyyh211m9ZB8EU2EUrF8EYboKXMG7ZAIPKqI81gCTfgbsmNOj1QJkNMvAC0Fsa1QOYOh9zVj97klPj22T6K_E8_tBI53lqyStE5HUqdKB6ZQBGVFz6p8OwLc7uUaiYeCisxKX8H6xz7g-ikvj-ZScZ4kzpgc87fC6m6jHuK4HVw0rXtFkYFjMkQ-1_JubK0_Kjs7H7fOM_upTtzCdPQiLGpFkMwvzr6_Vx_YueZitypkX7bvIW_a7RNDAUiHclBunH3T8AFCC4oMUM6slqtKWJTff2N1taOCsf3CCGur7kRqn1ark-lEs1aKTHTBLW77He-uwopkEbRBrAVJythyZUC2SPbfW8Zjfdp4ddJt0uBuvqIu6ccYQqqA-zwtyahDQyuJJymWkYwgmPiHl0I0BSBeqobiHaBxbZTzaib4CVNc_FuLxVrMbFqqlMJVd2Ri9ZEmpixA2D8LDCYN7HFJr6jrUdOd73-pRDUe_n4rogjyMu8QFm73R8UCG3cdQPLMWQerPFvW_g29cJnAreyzPhIQzIcElHDrphOTvIHACsqK7j5C3x-nouWWU2IS4NuVZ0QnilpE58q7eDtkS8FDV_zbUqd5JCgGCuv4d1dsWvOjaBMGGD6jrbyyxeYG5VZlnxSUS63ZWepGTsqLLcevkDIySEMIVk9lEBsyRB7LT9uxck2YCGQJKEzjjDsiTsOsTPeJV3XlE1lHD4QpQmxCX-X7DT_kXGwQA6xUKNQPhTljCIRbmbI4v3IqDUPSZbLZIPbuA6YZqwABRA=w1872-h957',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
