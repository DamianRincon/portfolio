import 'package:flutter/material.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../src/config/core.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    super.key,
    required this.portafolio,
    required this.contact,
    required this.skill,
    required this.aboutOfMe,
    this.openDrawer,
  });

  ///
  final GlobalKey portafolio;
  final GlobalKey contact;
  final GlobalKey skill;
  final GlobalKey aboutOfMe;
  final Function? openDrawer;

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint(
        "El contexto todavía no está disponible para ${key.toString()}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    Navigator.defaultRouteName,
                    ModalRoute.withName(Navigator.defaultRouteName),
                  ),
                  child: Image.asset(
                    Core.iconPath,
                    width: 35,
                    height: 35,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Visibility(
                  visible: Core.showUserName,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Navigator.defaultRouteName,
                      ModalRoute.withName(Navigator.defaultRouteName),
                    ),
                    child: Text(
                      Core.userName,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Wrap(
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Navigator.defaultRouteName,
                            ModalRoute.withName(Navigator.defaultRouteName),
                          ),
                          style: menuButtonStyle,
                          child: const Text("INICIO"),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(skill),
                          style: menuButtonStyle,
                          child: const Text("SKILL"),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(portafolio),
                          onHover: (value) {},
                          style: menuButtonStyle,
                          child: const Text("PORTAFOLIO"),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(aboutOfMe),
                          style: menuButtonStyle,
                          child: const Text("ACERCA DE MI"),
                        ),
                        TextButton(
                          onPressed: () => scrollTo(contact),
                          style: menuButtonStyle,
                          child: const Text("CONTACTO"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 30),
            color: const Color(0xFFEEEEEE),
          ),
        ],
      ),
      mobile: (_) => _mobile(context, openDrawer),
      tablet: (_) => _mobile(context, openDrawer),
    );
  }

  Widget _mobile(context, openDrawer) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Navigator.defaultRouteName,
                ModalRoute.withName(Navigator.defaultRouteName),
              ),
              child: Image.asset(
                Core.iconPath,
                width: 35,
                height: 35,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            /*Transform.translate(
              offset: const Offset(16, 0),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => openDrawer,
              ),
            ),*/
          ],
        ),
      ),
      Container(
        height: 1,
        margin: const EdgeInsets.only(bottom: 30),
        color: const Color(0xFFEEEEEE),
      ),
    ],
  );
}
