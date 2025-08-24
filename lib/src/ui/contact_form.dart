import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portafolio/src/components/footer.dart';
import 'package:portafolio/src/config/core.dart';
import 'package:portafolio/src/config/typography.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactForm extends StatelessWidget {
  ContactForm({super.key});
  final TextEditingController personName = TextEditingController();
  final TextEditingController personEmail = TextEditingController();
  final TextEditingController personSubject = TextEditingController();
  final TextEditingController personMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ScreenTypeLayout.builder(
      mobile: (_) => _forMobile(size, context),
      tablet: (_) => _forMobile(size, context),
      desktop: (_) => _forDesktop(size, context),
    );
  }

  Widget _forMobile(Size size, context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    padding: EdgeInsets.all(25),
    width: size.width,
    height: 1100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title,
        Container(
          width: size.width,
          height: 375,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 0.5, color: Color(0xFFA0A0A0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _locationInfo,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: size.width,
          height: 560,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(width: 0.5, color: Color(0xFFA0A0A0)),
          ),
          child: Column(
            children: [
              _inputUsername(personName),
              const SizedBox(height: 20),
              _inputEmail(personEmail),
              const SizedBox(height: 20),
              _inputSubject(personSubject),
              const SizedBox(height: 20),
              _inputMessage(personMessage),
              const SizedBox(height: 20),
              _successButton(
                personEmail,
                personName,
                personSubject,
                personMessage,
                context,
              ),
            ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size.width * .3,
              height: size.height * .65,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 0.5, color: Color(0xFFA0A0A0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _locationInfo,
              ),
            ),
            Container(
              width: size.width * .6,
              height: size.height * .65,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 0.5, color: Color(0xFFA0A0A0)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .25,
                        child: _inputUsername(personName),
                      ),
                      SizedBox(
                        width: size.width * .25,
                        child: _inputEmail(personEmail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _inputSubject(personSubject),
                  const SizedBox(height: 30),
                  _inputMessage(personMessage),
                  const SizedBox(height: 30),
                  _successButton(
                    personEmail,
                    personName,
                    personSubject,
                    personMessage,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _title = Text("Ponte en contacto, conmigo.", style: headlineTextStyle);

Widget _inputUsername(personName) => TextField(
  controller: personName,
  decoration: InputDecoration(
    hint: Text("Nombre", style: TextStyle(color: Color(0xFFA0A0A0))),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFA0A0A0), width: 0.5),
    ),
  ),
);

Widget _inputEmail(personEmail) => TextField(
  controller: personEmail,
  decoration: InputDecoration(
    hint: Text("Correo", style: TextStyle(color: Color(0xFFA0A0A0))),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFA0A0A0), width: 0.5),
    ),
  ),
);
Widget _inputSubject(personSubject) => TextField(
  controller: personSubject,
  decoration: InputDecoration(
    hint: Text("Asunto:", style: TextStyle(color: Color(0xFFA0A0A0))),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFA0A0A0), width: 0.5),
    ),
  ),
);

Widget _inputMessage(personMessage) => TextField(
  maxLines: 7,
  minLines: 5,
  controller: personMessage,
  decoration: InputDecoration(
    hint: Text(
      "¿En que podemos ayudarte?, estoy ansioso de escuchar tus ideas:",
      style: TextStyle(color: Color(0xFFA0A0A0)),
    ),
    hintMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Color(0xFFA0A0A0), width: 0.5),
    ),
  ),
);

Widget _successButton(
  personEmail,
  personName,
  personSubject,
  personMessage,
  context,
) => TextButton.icon(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.black),
    minimumSize: WidgetStateProperty.all(Size(250, 50)),
  ),
  onPressed: () {
    String email = personEmail.text;
    String name = personName.text;
    String subject = personSubject.text;
    String content = personMessage.text;
    if (email != "" && name != "" && content != "") {
      sendEmail(
        email: email,
        name: name,
        message: content,
        subject: subject,
        context: context,
      );
      personName.clear();
      personEmail.clear();
      personSubject.clear();
      personMessage.clear();
    }
  },
  label: Text("Enviar mensaje", style: TextStyle(color: Colors.white)),
  icon: Icon(Icons.send, color: Colors.white),
  iconAlignment: IconAlignment.end,
);
List<Widget> _locationInfo = [
  Icon(Icons.location_on),
  Text("Ubicación actual:", style: headlineSecondaryTextStyle),
  Text("San Vicente, Nay.", style: subtitleTextStyle),
  dividerSmall,
  Icon(Icons.phone),
  Text("Número de contacto:", style: headlineSecondaryTextStyle),
  Text("+52 (961) 173 3525", style: subtitleTextStyle),
  dividerSmall,
  Icon(Icons.email),
  Text("Correo:", style: headlineSecondaryTextStyle),
  Text("damianrincon.dev@gmail.com", style: subtitleTextStyle),
];

Future<void> sendEmail({
  required String name,
  required String email,
  required String message,
  required String subject,
  required BuildContext context,
}) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {'origin': 'http://localhost', 'Content-Type': 'application/json'},
    body: json.encode({
      'service_id': Core.serviceId,
      'template_id': Core.templateId,
      'user_id': Core.userId,
      'template_params': {
        'name': name,
        'email': email,
        'message': message,
        'title': subject,
      },
    }),
  );

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "✅ Email enviado correctamente, pronto nos pondremos en contacto.",
        ),
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("❌ Email no enviado correctamente, intentelo más tarde."),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
