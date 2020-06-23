import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = '5705a85b-1425-4ef8-a1e5-e7e0f13c0699';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url = 'https://api.thecatapi.com/v1/images/search?limit=5&page=10&order=Desc#';



@override
void initState() { 
  super.initState();
 apiCall();
  
}

 void apiCall() async {
    var response = await http.get(url);
    var data = response.body;
    List<String> urlList;

    for (var i = 0; i < 5; i++) {
      var imageUrl = jsonDecode(data)[i]['url'];
      print(imageUrl);
      urlList.insert(i,imageUrl);
    }
    // print(urlList);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
