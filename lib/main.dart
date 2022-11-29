import 'package:flutter/material.dart';
import './pages/home_page.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Healthcare Demo",
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: const HomePage(),
    );
  }
}
