import 'package:flutter/material.dart';
import 'package:flutter_parallax_scrolling/screens/simple_parallex_screen.dart';
// import 'package:parallax_scrolling/screens/simple_parallex_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parallax',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SimpleParallaxScreen(),
    );
  }
}
