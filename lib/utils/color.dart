import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}


const kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

const kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);