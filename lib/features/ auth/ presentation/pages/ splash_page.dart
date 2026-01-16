import 'package:familly_apps/features/%20auth/%20presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

import '../widgets/circular_loader.dart';
import '../widgets/text.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Enlève la petite bannière "Debug"
    home: MonSplashScreenPage(),
  ));
}

class MonSplashScreenPage extends StatelessWidget {
  const MonSplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // On peut définir la couleur de fond ici
      backgroundColor: Colors.black,
      body:
      Center(
       child :Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MonLogo(),
                const SizedBox(height: 1),
                const CustomText(
                  'Djomo Family',
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: MonLoaderPerso(),
          ),
        ],
      ),
      )
    );
  }
}