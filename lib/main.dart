import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformTheme(
      builder: (context) {
        return const PlatformApp(
          title: 'Flutter',
          home: Home(),
        );
      },
      themeMode: ThemeMode.light,
      materialLightTheme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
              filled: true, fillColor: Colors.white60)),
      cupertinoLightTheme: const CupertinoThemeData(primaryColor: Colors.blue),
    );
  }
}
