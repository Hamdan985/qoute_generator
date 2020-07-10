import 'package:flutter/material.dart';

const kStartBackgroundGradient = Color(0xFF0F2027);
const kendBackgroundGradient = Color(0xFF2C5364);

const kBackgroundGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [kStartBackgroundGradient, kendBackgroundGradient],
  ),
);

const kFloatingActionButtonColour = Color(0xFF0F2027);

const kQuoteTextStyle = TextStyle(
  fontFamily: 'Eczar',
  fontSize: 25,
  color: Colors.white54,
);

const kQuoteAuthorStyle = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 30,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.grey,
      offset: Offset(2.0, 2.0),
    ),
  ],
);
