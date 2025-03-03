import 'package:flutter/material.dart';
import 'package:julelotteri_frontend/ui/pages/home_page.dart';
import 'package:julelotteri_frontend/ui/components/custom_appbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // This allows your body content to extend behind the AppBar.
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(), // Removed const here
        backgroundColor: Color(0xFFC41E3A),
        body: HomePage(),
      ),
    );
  }
}
