import 'dart:core';
import 'package:flutter/material.dart';
import 'package:simpleapiapp/widgets/display_quote.dart';
import 'package:simpleapiapp/constants.dart';
import '../services/quotes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;

  @override
  void initState() {
    super.initState();
    context.read<Quotes>().apiCall();
    context.read<Quotes>().apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kFloatingActionButtonColour,
        child: Icon(
          Icons.navigate_next,
          size: 35.0,
        ),
        onPressed: () {
          if (check == false) {
            context.read<Quotes>().apiCall();
            check = !check;
          } else {
            context.read<Quotes>().apiCall();
            check = !check;
          }
        }, //// call the api call here
      ),
      appBar: AppBar(
        title: Text('Quotes API app'),
        elevation: 0.0,
        backgroundColor: kStartBackgroundGradient,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: kBackgroundGradientDecoration,
            child: FutureBuilder(
                future: check
                    ? context.watch<Quotes>().nextQuote
                    : context.watch<Quotes>().quote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DisplayQuote(
                      quoteText: snapshot.data.quoteText,
                      quoteAuthor: snapshot.data.quoteAuthor,
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  // By default, show a loading spinner.
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
