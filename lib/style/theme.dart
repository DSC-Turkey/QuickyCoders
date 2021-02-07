import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFFFFF176); //0xFF8D6E63
  static const Color loginGradientEnd = const Color(0xFF795548); //0xFFB0BEC5
  static const Color primaryTextColor = Color(0xFF414C6B); //  0xFF414C6B
  static const Color secondaryTextColor = Color(0xFFE4979E); //0xFFE4979E
  static const Color titleTextColor = Color(0xff868686);
  static const Color contentTextColor = Color(0xff868686);
  static const Color navigationColor = Color(0xFF6751B5);
  static const Color gradientStartColor = Color(0xFFFFF176); //0xFF0050AC
  static const Color gradientEndColor = Color(0xFF795548); //0xFF9354B9

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
