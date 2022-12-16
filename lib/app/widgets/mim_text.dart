import 'package:flutter/material.dart';

class MimText extends Text {
  MimText(
    super.title, {
    super.key,
    super.maxLines,
    super.overflow,
    FontWeight weight = FontWeight.w600,
    TextAlign? align,
    double size = 16.0,
    TextDecoration? decoration,
    Color color = const Color(0xFF333333),
  }) : super(
          textAlign: align,
          style: TextStyle(
            fontWeight: weight,
            color: color,
            fontSize: size,
            decoration: decoration,
          ),
        );
}
