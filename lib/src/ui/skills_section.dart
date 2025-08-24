import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../config/typography.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScreenTypeLayout.builder(
      desktop: (_) => _forDesktop(size),
      mobile: (_) => _forMobile(size),
      tablet: (_) => _forMobile(size),
    );
  }

  Widget _forMobile(Size size) => Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    padding: EdgeInsets.all(25),
    width: size.width,
    height: 750,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      children: [
        _title,
        _subtitle,
        SizedBox(height: 30),
        SizedBox(
          width: size.width,
          height: 500,
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
            ),
            children: _itemsGrid,
          ),
        ),
      ],
    ),
  );
  Widget _forDesktop(Size size) => Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    padding: EdgeInsets.all(25),
    width: size.width,
    height: size.height * .85,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      children: [
        _title,
        _subtitle,
        SizedBox(height: 30),
        SizedBox(
          width: size.width,
          height: size.height * .6,
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            children: _itemsGrid,
          ),
        ),
      ],
    ),
  );
}

Widget itemGrid(String link, String name) => Column(
  children: [
    Image.network(link, width: 50, height: 50),
    Text(name, style: bodyTextStyle),
  ],
);

Widget _title = Text(
  "Estas son algunas de mis skill.",
  style: headlineTextStyle,
);
Widget _subtitle = Text(
  "A lo largo del tiempo he aprendido que nunca dejas de aprender.",
  style: headlineSecondaryTextStyle,
);

List<Widget> _itemsGrid = [
  itemGrid(
    "https://img.icons8.com/?size=100&id=zfHRZ6i1Wg0U&format=png&color=000000",
    "Figma",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=12239&format=png&color=000000",
    "HTML 5",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=63777&format=png&color=000000",
    "Github",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=UFXRpPFebwa2&format=png&color=000000",
    "MySQL",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=74402&format=png&color=000000",
    "MongoDB",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=17842&format=png&color=000000",
    "Linux",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=EgOU93v1DHjU&format=png&color=000000",
    "Android",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=63788&format=png&color=000000",
    "Xcode",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=7I3BjCqe9rjG&format=png&color=000000",
    "Flutter",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=114474&format=png&color=000000",
    "JSON",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=62452&format=png&color=000000",
    "Firebase",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=22988&format=png&color=000000",
    "Playstore",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=fKXXelWgP1B6&format=png&color=000000",
    "AppStore",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=21896&format=png&color=000000",
    "Api REST",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=32215&format=png&color=000000",
    "Google Maps",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=lRjcvhvtR81o&format=png&color=000000",
    "Laravel",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=54087&format=png&color=000000",
    "NodeJS",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=UGYn5TapNioV&format=png&color=000000",
    "PHP",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=j9DnICNnlhGk&format=png&color=000000",
    "Angular",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=13441&format=png&color=000000",
    "Python",
  ),
  itemGrid(
    "https://img.icons8.com/?size=100&id=HSUyAxXlFIh4&format=png&color=000000",
    "Codeigniter",
  ),
];
