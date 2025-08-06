import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PetServicesApp());
}

class PetServicesApp extends StatelessWidget {
  const PetServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Services Aggregator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2E7D7D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D7D),
          primary: const Color(0xFF2E7D7D),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2E7D7D),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}