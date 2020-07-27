import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFFFF8412);
Color kBackgroundColor = Color(0xFFEFF4F8);

LinearGradient kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.2, 0.4, 0.7],
  colors: [
    Colors.black.withOpacity(0.3),
    Colors.transparent,
    Colors.black.withOpacity(0.3),
  ],
);