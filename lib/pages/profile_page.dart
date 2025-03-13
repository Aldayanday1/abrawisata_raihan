import 'package:abrawisata/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:abrawisata/pages/edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Full Screen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.yellow, Colors.orange],
              ),
            ),
          ),

          // SafeArea agar tidak tertutup status bar
          SafeArea(
            child: Column(
              children: [
                // AppBar Custom dengan Ikon
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon Edit (Kiri Atas)
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //       content: Text("Navigasi ke EditPage")),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditPage()),
                          );
                        },
                      ),

                      // Icon Logout (Kanan Atas)
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandingPage(),
                              ));
                          // Tambahkan fungsi logout di sini
                        },
                      ),
                    ],
                  ),
                ),

                // Konten utama
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                              height: 20), // Jarak dari atas lebih kecil

                          // Avatar Profile
                          const CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),

                          const SizedBox(
                              height:
                                  10), // Jarak antara avatar dan form dikurangi

                          // Form Input Fields
                          _buildTextField(
                              label: "E-mail",
                              hintText: "abrawisata@gmail.com"),
                          const SizedBox(height: 5),
                          _buildPasswordField(label: "Password"),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Input Field
Widget _buildTextField({required String label, required String hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      TextField(
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ],
  );
}

// Password Field
Widget _buildPasswordField({required String label}) {
  TextEditingController _controller = TextEditingController(text: "**********");

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: _controller, // Set default value
        obscureText: true, // Tetap disembunyikan
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.visibility_off, size: 18),
        ),
      ),
    ],
  );
}
