import 'package:flutter/material.dart';
import 'package:portafolio/src/config/core.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScreenTypeLayout.builder(
      desktop: (_) => _forDesktop(size, context),
      mobile: (_) => _forMobile(size, context),
      tablet: (_) => _forMobile(size, context),
    );
  }

  Widget _forMobile(Size size, context) => Container(
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
          height: 450,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _contentGrid(context),
          ),
        ),
      ],
    ),
  );

  Widget _forDesktop(Size size, context) => Container(
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
        SizedBox(
          width: size.width,
          height: size.height * .7,
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            children: _contentGrid(context),
          ),
        ),
      ],
    ),
  );
}

Widget _title = Text("Algunos de mis proyectos.", style: headlineTextStyle);
Widget _subtitle = Text(
  "Estos son algunos de mis proyectos meticulosamente elaborados con amor y dedicación.",
  style: headlineSecondaryTextStyle,
);

List<Widget> _contentGrid(context) => [
  cardItem(
    "assets/images/nuxui.png",
    "Nuxui",
    "Una aplicación con ejemplos de UX/UI modernas y minimalistas.",
    "https://play.google.com/store/apps/details?id=mx.demianrc.nux_ui",
    context,
  ),
  cardItem(
    "assets/images/scanqr.png",
    "ScanNCreateQR",
    "Aplicación creada para leer, crear y visualizar QR's de cualquier tipo.",
    "https://play.google.com/store/apps/details?id=mx.com.damianrc.free_qr_scann",
    context,
  ),
  cardItem(
    "assets/images/tictactow.png",
    "Tic Tac Toe",
    "Una aplicación con ejemplos de UX/UI modernas y minimalistas.",
    "https://play.google.com/store/apps/details?id=mx.damianrc.dev.tic_tac_toe",
    context,
  ),
  cardItem(
    "assets/images/vault_free.png",
    "Vault Free",
    "Una aplicación con ejemplos de UX/UI modernas y minimalistas.",
    "https://play.google.com/store/apps/details?id=mx.com.damianrc.vault_free",
    context,
  ),
  cardItem(
    "assets/images/material_color.png",
    "Material Color Palette",
    "Una aplicación basada en Material Design 2, con animaciones y colores correspondientes.",
    "https://play.google.com/store/apps/details?id=tech.incilius.materialcolorpalette",
    context,
  ),
];
Widget cardItem(
  String imagePath,
  String name,
  String description,
  String link,
  BuildContext context,
) => GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          width: 400,
          height: 500,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Hero(tag: "image", child: Image.asset(imagePath)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name, style: headlineSecondaryTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description, style: subtitleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Disponible para Android",
                  style: subtitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Descarga mediante Playstore",
                  style: subtitleTextStyle,
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.black),
              minimumSize: WidgetStateProperty.all(Size(250, 50)),
            ),
            onPressed: () {
              Core.openLink(link);
            },
            label: Text("Visitar", style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.link, color: Colors.white),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  },
  child: Card(
    elevation: 5,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: SizedBox(
      width: 250,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Hero(tag: "image", child: Image.asset(imagePath)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: headlineTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: subtitleTextStyle),
          ),
        ],
      ),
    ),
  ),
);
