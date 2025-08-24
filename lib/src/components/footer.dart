import 'package:flutter/material.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => _mobile(),
      tablet: (_) => _mobile(),
      desktop: (_) => _desktop(),
    );
  }

  Widget _mobile() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [_madeby, _copyright],
  );
  Widget _desktop() => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [SizedBox(), SizedBox(), _madeby, _copyright],
  );
}

Widget _madeby = RichText(
  text: TextSpan(
    style: bodyTextStyle,
    children: [
      TextSpan(text: "Hecho con "),
      WidgetSpan(child: FlutterLogo(size: 20)),
      TextSpan(text: " hecho con "),
      WidgetSpan(child: Icon(Icons.favorite, color: Colors.blue)),
    ],
  ),
);

Widget _copyright = Text(
  "Copyright © 2025, All Rights Reserved.",
  style: bodyTextStyle,
);
const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);

Widget dividerSmall = Container(
  width: 100,
  padding: EdgeInsets.all(20),
  decoration: const BoxDecoration(
    border: Border(bottom: BorderSide(color: Color(0xFFA0A0A0), width: 1)),
  ),
);
