import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int _selectedIndex = 0; // Sesuaikan index dengan posisi AddPage2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 17.0, top: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: true, // Membuat app bar transparan
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

          // Konten Utama
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 130), // Jarak dari atas lebih kecil

                  // Avatar Profile
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.orange,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height: 10), // Jarak antara avatar dan form dikurangi

                  // Form Input Fields
                  _buildTextField(label: "Nama", hintText: "CV. Abra Wisata"),
                  const SizedBox(height: 5),
                  _buildTextField(
                      label: "E-Mail", hintText: "abrawisata@gmail.com"),
                  const SizedBox(height: 5),
                  _buildPasswordField(label: "Password"),
                  const SizedBox(height: 5),
                  _buildPasswordField(label: "Confirm Password"),
                  const SizedBox(
                      height: 15), // Jarak antara form dan button lebih kecil

                  // Save Button di sisi kanan
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {},
        showSelectedLabels: false, // Sembunyikan teks label yang dipilih
        showUnselectedLabels:
            false, // Sembunyikan teks label yang tidak dipilih
        type: BottomNavigationBarType.fixed, // Pastikan semua ikon muncul
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/note_stack_add.png', 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/home.png', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/view_day.png', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/account_circle.png', 0),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _selectedIndex == index ? Colors.black : Colors.grey,
        BlendMode.srcIn,
      ),
      child: Image.asset(assetPath, width: 24, height: 24),
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

// // Password Field
// Widget _buildPasswordField({required String label}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//             fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
//       ),
//       const SizedBox(height: 10),
//       TextField(
//         obscureText: true,
//         style: const TextStyle(fontSize: 12),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide.none,
//           ),
//           suffixIcon: const Icon(Icons.visibility_off, size: 18),
//         ),
//       ),
//     ],
//   );
// }

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
