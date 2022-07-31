import 'package:flutter/material.dart';
import 'package:numbers_game/Pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: const home(),
    );
  }
}
