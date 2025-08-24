import 'package:flutter/material.dart';
import 'package:portafolio/src/components/footer.dart';
import 'package:portafolio/src/components/toolbar.dart';
import 'package:portafolio/src/config/utils.dart';
import 'package:portafolio/src/ui/contact_form.dart';
import 'package:portafolio/src/ui/personal_section.dart';
import 'package:portafolio/src/ui/portfolio.dart';
import 'package:portafolio/src/ui/skills_section.dart';
import 'package:portafolio/src/ui/study_section.dart';

class Index extends StatefulWidget {
  static const String name = 'index';
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final GlobalKey contact = GlobalKey();
  final GlobalKey portafolio = GlobalKey();
  final GlobalKey skill = GlobalKey();
  final GlobalKey aboutOfMe = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              Toolbar(
                contact: contact,
                portafolio: portafolio,
                skill: skill,
                aboutOfMe: aboutOfMe,
              ),
              PersonalSection(),
              dividerSmall,
              Container(key: skill, child: SkillsSection()),
              dividerSmall,
              Container(key: portafolio, child: Portfolio()),
              dividerSmall,
              Container(key: aboutOfMe, child: StudySection()),
              dividerSmall,
              Container(key: contact, child: ContactForm()),
            ].toMaxWidth(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: 105,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Footer(),
            ),
          ),
        ],
      ),
    );
  }
}
