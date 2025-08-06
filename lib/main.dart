import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(PetServicesApp());
}

class PetServicesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Services Aggregator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF4A90E2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4A90E2),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}