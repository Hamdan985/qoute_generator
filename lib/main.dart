import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import './services/quotes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Quotes>(create: (_) => Quotes()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
