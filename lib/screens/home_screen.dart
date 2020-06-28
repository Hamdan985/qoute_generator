import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simpleapiapp/models/quote.dart';
import 'package:simpleapiapp/widgets/display_quote.dart';
import 'package:simpleapiapp/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = 'https://api.quotable.io/random';

  Future<Quote> quote;
  Future<Quote> secondQuote;
  bool check = false;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() {
    setState(() {
      if (check == false) {
        print('quote');
        check = !check;
        quote = fetchQuote();
      } else {
        print('second quote');

        secondQuote = fetchQuote();
        check = ! check;
      }
    });
  }

  Future<Quote> fetchQuote() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Quote.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Quote');
    }
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
        onPressed: apiCall,
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
          ),
          FutureBuilder(
              future: check ? secondQuote : quote,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DisplayQuote(
                    quoteText: snapshot.data.quoteText,
                    quoteAuthor: snapshot.data.quoteAuthor,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }
}
