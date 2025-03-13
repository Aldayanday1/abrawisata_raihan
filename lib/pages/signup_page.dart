import 'package:abrawisata/pages/landing_page.dart';
import 'package:abrawisata/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Fullscreen
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_yellow.png', // Pastikan path sesuai
              fit: BoxFit.cover, // Gambar memenuhi layar
            ),
          ),

          // Tombol Back di Ujung Kiri Atas
          Positioned(
            top: 65,
            left: 25,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Konten (Form dan Judul)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height:
                        135), // Ruang agar tidak bertabrakan dengan tombol back

                // Judul
                const Text(
                  "Buat Akun\nDisini !",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                // Form
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTextField(label: "Nama"),
                      const SizedBox(height: 17),
                      _buildTextField(label: "Email"),
                      const SizedBox(height: 17),
                      _buildPasswordField(label: "Password"),
                      const SizedBox(height: 17),
                      _buildPasswordField(label: "Confirm Password"),
                      const SizedBox(height: 20),

                      // Tombol Sign Up
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika Sign Up di sini
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LandingPage(),
                                ));
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
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi membuat TextField biasa
  Widget _buildTextField({required String label}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Fungsi membuat TextField dengan ikon mata untuk password
  Widget _buildPasswordField({required String label}) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: Icon(Icons.visibility_off),
      ),
    );
  }
}
