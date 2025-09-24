import 'package:expense_tracker_lite/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker Lite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1D55F3),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1D55F3)),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const DashboardScreen(),
    );
  }
}
