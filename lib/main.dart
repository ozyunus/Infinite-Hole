import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InfiniteHoleApp());
}

class InfiniteHoleApp extends StatelessWidget {
  const InfiniteHoleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinite Hole',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}
