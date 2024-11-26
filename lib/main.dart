import 'package:flutter/material.dart';
import 'package:kambily/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kambily',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF048B9A),
        ),
        fontFamily: 'Krub',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
