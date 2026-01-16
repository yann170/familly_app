import 'package:flutter/material.dart';



class MonLoaderPerso extends StatelessWidget {
  // 1. On définit les variables que l'on veut pouvoir changer
  final Color couleur;
  final double epaisseur;
  final double taille;


  // 2. Le constructeur permet de recevoir ces valeurs
  // On met des valeurs par défaut (ex: Colors.blue) au cas où l'utilisateur n'en donne pas
  const MonLoaderPerso({
    super.key,
    this.couleur =  const Color(0xFFFF7A00),
    this.epaisseur = 4.0,
    this.taille = 70.0,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // On utilise la variable 'taille' pour définir la zone
      width: taille,
      height: taille,
      child: CircularProgressIndicator(
        // On injecte les variables ici
        color: couleur,
        strokeWidth: epaisseur,
      ),
    );
  }
}