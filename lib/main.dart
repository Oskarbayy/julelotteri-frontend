import 'package:flutter/material.dart';
import 'package:julelotteri_app/ui/components/custom_appbar.dart';
import 'package:julelotteri_app/ui/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // This allows your body content to extend behind the AppBar.
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(), // Removed const here
        backgroundColor: const Color(0xFFC41E3A),
        body: const HomePage(),
      ),
    );
  }
}
