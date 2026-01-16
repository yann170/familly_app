import 'package:flutter/material.dart';
import 'package:familly_apps/core/di/injection_container.dart';
import 'features/ auth/ presentation/pages/ splash_page.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MonSplashScreenPage(), // Utilisez le nom exact de votre widget
    );
  }
}