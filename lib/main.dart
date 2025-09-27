import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/navigation_container_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const NavigationContainerScreen(),
    );
  }
}
