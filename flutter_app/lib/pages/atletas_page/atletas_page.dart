import 'package:flutter/material.dart';
import 'package:flutter_app/api/atleta/get/get_atletas.dart';
import 'package:flutter_app/pages/home_page/home_page.dart';
import 'package:flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter_app/shared/widgets/atleta_experience/atleta_experience_widget.dart';
import 'package:flutter_app/shared/widgets/banner_widget/banner_widget.dart';
import 'package:flutter_app/shared/widgets/tab_title_widget/tab_title_widget.dart';

class AtletasPage extends StatefulWidget {
  const AtletasPage({super.key});

  @override
  State<AtletasPage> createState() => _AtletasPageState();
}

class _AtletasPageState extends State<AtletasPage> {
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
                  const BannerWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Encontre seus atletas favoritos',
                    style: AppTextStyles.title,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: SearchBar(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0),
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color(
                            0xffF5F7FA,
                          ),
                        ),
                        hintText: "Encontrar atleta",
                        leading: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.search,
                            color: Color(0xff718EBF),
                          ),
                        ),
                        onChanged: (d) => print("dfsdf"),
                        controller: searchEditingController,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: FutureBuilder(
                      future: GetAtletas.fetch()!,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Wrap(
                          runSpacing: 20,
                          spacing: 20,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            for (int i = 0; i < snapshot.data!.length; i++)
                              Builder(
                                builder: (context) {
                                  Map<String, dynamic> dadosAtleta =
                                      snapshot.data![i];
                                  print(dadosAtleta["id"]!);
                                  return CardExperienceAtletaWidget(
                                    id: dadosAtleta["id"]!,
                                    nomeDoAtleta: dadosAtleta["athleteName"],
                                    bio: dadosAtleta['description'],
                                    tags: const [
                                      "Final Olimpíca",
                                    ],
                                    flagId: "BR",
                                    imageDoAtleta: dadosAtleta["imageUrl"],
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    ),
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
