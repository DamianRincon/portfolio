import 'package:flutter/material.dart';
import 'package:portafolio/src/components/footer.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StudySection extends StatelessWidget {
  const StudySection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScreenTypeLayout.builder(
      desktop: (_) => _forDesktop(size),
      mobile: (_) => _forMobile(size),
    );
  }

  Widget _forMobile(Size size) => Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: EdgeInsets.all(25),
        width: size.width,
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(children: _jobs),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: EdgeInsets.all(25),
        width: size.width,
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(children: _work),
      ),
    ],
  );
  Widget _forDesktop(Size size) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: EdgeInsets.all(25),
        width: size.width * 0.4,
        height: size.height * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(children: _jobs),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        padding: EdgeInsets.all(25),
        width: size.width * 0.4,
        height: size.height * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(children: _work),
      ),
    ],
  );
}

List<Widget> _jobs = [
  Text("Educación", style: headlineTextStyle),
  dividerSmall,
  const SizedBox(height: 20),
  ListTile(
    title: Text(
      "UTS - Universidad Tecnologica de la Selva",
      style: headlineSecondaryTextStyle,
    ),
    subtitle: Text("Ingenieria en Tecnologias de la Información"),
  ),
  divider,
  ListTile(
    title: Text(
      "UTS - Universidad Tecnologica de la Selva",
      style: headlineSecondaryTextStyle,
    ),
    subtitle: Text("TSU Sistemas Informaticos"),
  ),
  divider,
  ListTile(
    title: Text(
      "Cecyt 22 - Ricardo Flores Magón",
      style: headlineSecondaryTextStyle,
    ),
    subtitle: Text("Soporte y mantenimiento de hardware y software"),
  ),
];

List<Widget> _work = [
  Text("Experiencia", style: headlineTextStyle),
  dividerSmall,
  const SizedBox(height: 20),
  ListTile(
    title: Text("Stratplus", style: headlineSecondaryTextStyle),
    subtitle: Text("Fullstack Developer mobile"),
    trailing: Text("2021 - Actualidad", style: subtitleTextStyle),
  ),
  divider,
  ListTile(
    title: Text("Onikom LATAM", style: headlineSecondaryTextStyle),
    subtitle: Text("Backend developer", style: bodyTextStyle),
    trailing: Text("2019 - 2021", style: subtitleTextStyle),
  ),
  divider,
  ListTile(
    title: Text("Hyperion Digital Group", style: headlineSecondaryTextStyle),
    subtitle: Text("Fullstack Web developer", style: bodyTextStyle),
    trailing: Text("2018 - 2019", style: subtitleTextStyle),
  ),
];
