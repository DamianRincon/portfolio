import 'package:url_launcher/url_launcher.dart';

class Core {
  static String appName = "Portafolio";
  static bool showUserName = false;
  static String userName = "Damián Rincón";
  static String presentation =
      "Soy Desarrollador de movíl, diseño, construyo y a veces rescato aplicaciones.";
  static String iconPath = "assets/images/icon_opt.png";
  static String personalPhoto = "assets/images/yo.jpg";

  /// EMAILJS CONFIG
  static String serviceId = '';
  static String templateId = '';
  static String userId = '';

  /// SOCIAL MEDIA
  static String facebook = "";
  static String github = "";
  static String linkedin = "";
  static String playstore = "";
  static String twitter = "";
  static String codepen = "";
  static String gmail = "mailto:damianrc.dev@gmail.com";
  static String stackoverflow = "";

  static String jsonExample = """const developer = {
    name: 'Damián Rincón',
    role: 'Fullstack Dev 🚀',
    level: 29,
    experienceYears: 6,
    achievements: {
      fixedBugs: '40k+ 🐛🔥',
      cupsOfCoffee: '999+ ☕',
      lateNightCommits: 'countless 🌙',
      publishedApps: '10+ 🏆',
    },
    hardWorker: true,
    quickLearner: true,
    currentStatus: 'Grinding XP and open to new adventures 🎮',
}""";

  static Future<void> openLink(String link) async {
    final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
