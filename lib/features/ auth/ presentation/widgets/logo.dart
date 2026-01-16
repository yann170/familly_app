import 'package:flutter/material.dart';



class MonLogo extends StatelessWidget {
  final String path;
  final double taille;
  final BoxFit fit;

  const MonLogo({
    super.key,
    // On peut mettre le chemin par défaut de ton logo ici
    this.path = 'assets/images/djomo_familly.png',
    this.taille = 120.0,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width : taille,
      height: taille,
      fit: fit,
      // Option pour éviter que l'app crash si le chemin est faux
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.image_not_supported,
          size: taille,
          color: Colors.grey,
        );
      },
    );
  }
}
