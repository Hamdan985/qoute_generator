import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simpleapiapp/models/quote.dart';
import 'package:simpleapiapp/widgets/display_quote.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = 'https://api.quotable.io/random';

  Future<Quote> quote;

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  void apiCall() {
    setState(() {
      quote = fetchQuote();
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
        backgroundColor: Color(0xFF0F2027),
        child: Icon(
          Icons.navigate_next,
          size: 35.0,
        ),
        onPressed: apiCall,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
              ),
            ),
          ),
          FutureBuilder(
              future: quote,
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
