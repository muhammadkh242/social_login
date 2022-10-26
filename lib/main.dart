import 'package:flutter/material.dart';
import 'package:sociallogin/user_info/user_info_screen.dart';
import 'package:sociallogin/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 20,
          ),
        ),
        primarySwatch: Colors.pink,
      ),

      home: const HomeScreen(),
    );
  }
}
