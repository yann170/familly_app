import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight weight;
  final TextAlign align;
  final double? letterSpacing;
  final TextOverflow overflow;
  final int? maxLines;
  final bool isItalic;

  const CustomText(
      this.text, { // Le texte est le seul paramètre obligatoire
        super.key,
        this.size = 10.0,
        this.color,
        this.weight = FontWeight.normal,
        this.align = TextAlign.start,
        this.letterSpacing,
        this.overflow = TextOverflow.clip,
        this.maxLines,
        this.isItalic = false,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        color: color ??  const Color(0xFFFF7A00), // Noir par défaut si rien n'est passé
        fontWeight: weight,
        letterSpacing: letterSpacing,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}