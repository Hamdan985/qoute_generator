import 'dart:math';

import 'package:flutter/material.dart';

class DisplayQuote extends StatelessWidget {
  final String quoteText;
  final String quoteAuthor;

  const DisplayQuote({Key key, this.quoteText, this.quoteAuthor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              quoteText,
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 25,
                color: Colors.white54,
              ),
            ),
            Text(
              " ~ $quoteAuthor",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.grey,
                    offset: Offset(3.0, 3.0),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
