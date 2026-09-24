import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'styles/nutri_styles.dart';

void main() {
  runApp(const NutriFitApp());
}

class NutriFitApp extends StatelessWidget {
  const NutriFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriFit',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: NutriStyles.fundo,

        colorScheme: ColorScheme.fromSeed(
          seedColor: NutriStyles.verde,
        ),

        fontFamily: 'Arial',

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      home: const HomePage(),
    );
  }
}