import 'package:abrawisata/main_page.dart';
import 'package:abrawisata/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  "Selamat Datang Kembali !",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 150),

                // Form
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Tambahkan teks judul
                      const Text(
                        "Login to Your Account",
                        style: TextStyle(
                          fontSize:
                              20, // Ukuran lebih besar agar terlihat jelas
                          fontWeight:
                              FontWeight.normal, // Tebal agar lebih menonjol
                          color: Colors.white, // Warna putih sesuai permintaan
                        ),
                      ),
                      const SizedBox(
                          height: 20), // Jarak agar tidak terlalu rapat
                      // _buildTextField(label: "Nama"),
                      // const SizedBox(height: 17),
                      _buildTextField(label: "Email"),
                      const SizedBox(height: 17),
                      _buildPasswordField(label: "Password"),
                      const SizedBox(height: 17),
                      // _buildPasswordField(label: "Confirm Password"),
                      // const SizedBox(height: 20),

                      // Tombol Sign Up
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          // onPressed: () {
                          //   // Tambahkan logika Login di sini
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => MainPage(),
                          //     ),
                          //   );
                          // },
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
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
                            "Login",
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
