import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_page.dart'; // Import halaman tujuan

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menunggu 3 detik sebelum pindah ke halaman SignPage
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splashscreen.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover, // Gambar full screen
        ),
      ),
    );
  }
}
