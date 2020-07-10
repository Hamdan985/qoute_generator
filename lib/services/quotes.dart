import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

import 'package:flutter/foundation.dart';

class Quotes with ChangeNotifier {
  final String url = 'https://api.quotable.io/random';

  Future<Quote> _quote;
  Future<Quote> _nextQuote;
  bool check = false;

  Future<Quote> get quote => _quote;
  Future<Quote> get nextQuote => _nextQuote;

  void apiCall() {
    if (check == false) {
      print('quote');
      check = !check;
      _quote = fetchQuote();
    } else {
      print('second quote');

      _nextQuote = fetchQuote();
      check = !check;
    }
    notifyListeners();
  }

  Future<Quote> fetchQuote() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Quote.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Quote');
    }
  }
}
