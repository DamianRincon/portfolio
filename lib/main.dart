import 'package:flutter/material.dart';
import 'package:portafolio/src/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        final Uri uri = Uri.parse(settings.name ?? '/');
        return buildPage(path: uri.path, queryParams: uri.queryParameters);
      },
    ),
  );
}

//0:00:00.000400
Route<dynamic> buildPage({
  required String path,
  Map<String, String> queryParams = const {},
}) {
  return PageRouteBuilder(
    settings: RouteSettings(
      name: (path.startsWith('/') == false) ? '/$path' : path,
    ),
    pageBuilder: (context, animation, secondaryAnimation) {
      String pathName = path != '/' && path.startsWith('/')
          ? path.substring(1)
          : path;
      return SelectionArea(
        child: switch (pathName) {
          '/' || Index.name => const Index(),
          _ => const SizedBox.shrink(),
        },
      );
    },
  );
}
