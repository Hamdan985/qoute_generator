import 'package:flutter/material.dart';
import 'package:simpleapiapp/constants.dart';

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
            Text(quoteText, style: kQuoteTextStyle),
            Text(" ~ $quoteAuthor", style: kQuoteAuthorStyle),
          ]),
    );
  }
}
