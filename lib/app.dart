import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

class HangiYatirimApp extends StatelessWidget {
  const HangiYatirimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangi Yatırım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}