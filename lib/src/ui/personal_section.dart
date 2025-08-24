import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio/src/config/core.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalSection extends StatelessWidget {
  const PersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenTypeLayout.builder(
      mobile: (_) => _forMobile(size),
      tablet: (_) => _forMobile(size),
      desktop: (_) => _forDesktop(size),
    );
  }

  Widget _forMobile(Size size) => Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.all(25),
    width: size.width - 40,
    height: size.height * .8,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        _photo,
        const SizedBox(height: 20),
        Text(Core.userName, style: headlineTextStyle),
        const SizedBox(height: 20),
        Text(
          Core.presentation,
          textAlign: TextAlign.center,
          style: headlineSecondaryTextStyle,
        ),
        const SizedBox(height: 20),
        _socialMedia,
      ],
    ),
  );
  Widget _forDesktop(Size size) => Row(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(25),
        width: size.width * 0.3,
        height: size.height * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _photo,
            const SizedBox(height: 20),
            Text(Core.userName, style: headlineTextStyle),
            const SizedBox(height: 20),
            Text(
              Core.presentation,
              textAlign: TextAlign.center,
              style: headlineSecondaryTextStyle,
            ),
            const SizedBox(height: 20),
            _socialMedia,
          ],
        ),
      ),
      codePreview(size),
    ],
  );

  Widget codePreview(Size size) => Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: size.width * 0.6,
        height: size.height * .6,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.blueGrey[900]),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: size.width * 0.5,
                height: size.height * .45,
                child: DefaultTextStyle(
                  style: GoogleFonts.sourceCodePro(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  child: AnimatedTextKit(
                    pause: Duration(milliseconds: 500),
                    totalRepeatCount: 1,
                    animatedTexts: [TypewriterAnimatedText(Core.jsonExample)],
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 30),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: size.width * 0.6,
        height: size.height * .15,
        padding: EdgeInsets.all(30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contactame estoy seguro que puedo ayudarte.",
              style: headlineSecondaryTextStyle,
            ),
            IconButton.outlined(
              onPressed: () => Core.openLink(Core.gmail),
              icon: Image.network(
                "https://img.icons8.com/fluent/48/000000/gmail.png",
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _photo = Center(
  child: Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(200),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox.fromSize(
        size: Size.fromRadius(100), // Image radius
        child: Image.asset(Core.personalPhoto, width: 200, height: 200),
      ),
    ),
  ),
);

Widget _socialMedia = Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    IconButton(
      onPressed: () => Core.openLink(Core.twitter),
      icon: Image.network(
        "https://img.icons8.com/fluent/48/000000/twitter.png",
        width: 30,
        height: 30,
      ),
    ),
    IconButton(
      onPressed: () => Core.openLink(Core.linkedin),
      icon: Image.network(
        "https://img.icons8.com/?size=100&id=13930&format=png&color=000000",
        width: 30,
        height: 30,
      ),
    ),
    IconButton(
      onPressed: () => Core.openLink(Core.github),
      icon: Image.network(
        "https://img.icons8.com/fluent/48/000000/github.png",
        width: 30,
        height: 30,
      ),
    ),
    IconButton(
      onPressed: () => Core.openLink(Core.codepen),
      icon: Image.network(
        "https://img.icons8.com/material/24/000000/codepen.png",
        width: 30,
        height: 30,
      ),
    ),
    IconButton(
      onPressed: () => Core.openLink(Core.playstore),
      icon: Image.network(
        "https://img.icons8.com/color/48/000000/google-play.png",
        width: 30,
        height: 30,
      ),
    ),
    IconButton(
      onPressed: () => Core.openLink(Core.stackoverflow),
      icon: Image.network(
        "https://img.icons8.com/color/48/000000/stackoverflow.png",
        width: 30,
        height: 30,
      ),
    ),
  ],
);
