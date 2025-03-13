import 'package:abrawisata/pages/home_page.dart';
import 'package:abrawisata/pages/login_page.dart';
import 'package:abrawisata/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/landingpage.png', // Pastikan gambar ini ada di folder assets
              fit: BoxFit.cover,
            ),
          ),

          // Tombol Sign Up + Teks Login (Lebih ke bawah)
          Align(
            alignment: Alignment.bottomCenter, // Pindah ke bawah layar
            child: Padding(
              padding: const EdgeInsets.only(bottom: 290), // Jarak dari bawah
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Tombol Sign Up
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan aksi untuk Sign Up
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 231, 139, 0), // Warna sesuai desain
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20), // Jarak antara tombol dan teks

                  RichText(
                    text: TextSpan(
                      text: "Sudah Punya Akun? ",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                        fontWeight:
                            FontWeight.normal, // Gaya normal untuk teks biasa
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold, // Lebih tebal untuk "Login"
                            color: Colors.orange,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigasi ke halaman LoginPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
