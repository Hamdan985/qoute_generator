import 'package:flutter/material.dart';

const kBackgroundGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
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
      offset: Offset(3.0, 3.0),
    ),
  ],
);
