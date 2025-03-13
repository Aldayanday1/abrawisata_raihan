import 'package:abrawisata/pages/add_page.dart';
import 'package:abrawisata/pages/home_page.dart';
import 'package:abrawisata/pages/list_page.dart';
import 'package:abrawisata/pages/profile_page.dart';
import 'package:abrawisata/pages/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage3 extends StatefulWidget {
  AddPage3({super.key});

  @override
  State<AddPage3> createState() => _AddPage2State();
}

class _AddPage2State extends State<AddPage3> {
  int _selectedIndex = 0; // Sesuaikan index dengan posisi AddPage2

  final List<Widget> _pages = [
    AddPage(),
    HomePage(),
    ListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: 350, // Sesuaikan tinggi gradient
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(
                      255, 221, 148, 76), // Warna lebih gelap di atas
                  Color.fromARGB(
                      255, 233, 140, 0), // Warna utama (coklat keemasan)
                  Colors.orange.withOpacity(0.5), // Semi transparan
                  Colors.transparent, // Transparan di bawah
                ],
              ),
            ),
          ),

          // Konten yang bisa discroll
          Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      10), // Spacer untuk header

              // Tombol Back dan Judul
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, bottom: 10, top: 20),
                child: Row(
                  children: [
                    // Tombol Back dalam Lingkaran
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_back_ios_sharp,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Laporan Rugi Laba',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 5),

              // Search Bar
              // CustomSearchBar(),
              SizedBox(height: 10),

              // Expanded untuk daftar yang bisa discroll
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        minHeight: 650, // Menjadikan box lebih panjang ke bawah
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitle('VI. Pajak'),
                            _buildTextField(),
                            _buildTitle('Nominal Pajak'),
                            _buildTextField(),
                            _buildTitle('VII. Laba Usaha (Sesudah Pajak)'),
                            _buildTextField(),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Menjaga tombol tetap berjauhan
                              children: [
                                // Tombol Kembali
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(255, 229, 0, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25), // Lebih kecil dari 50
                                    ),
                                    minimumSize: Size(70,
                                        5), // Lebar 70, tinggi 35 untuk tombol ramping
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5), // Padding dikurangi
                                  ),
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Kembali ke halaman sebelumnya
                                  },
                                  child: Text(
                                    'Prev',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                // Tombol Next
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 241, 145, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25), // Lebih kecil dari 50
                                    ),
                                    minimumSize: Size(70,
                                        5), // Lebar 70, tinggi 35 untuk tombol ramping
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5), // Padding dikurangi
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CupertinoAlertDialog(
                                          title: Text("Konfirmasi"),
                                          content: Text(
                                              "Apakah Data yang Dimasukkan Sudah Benar?"),
                                          actions: [
                                            CupertinoDialogAction(
                                              child: Text("Batal"),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Tutup dialog
                                              },
                                            ),
                                            CupertinoDialogAction(
                                              child: Text("Ya"),
                                              isDestructiveAction:
                                                  true, // Warna teks merah (opsional)
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultPages(),
                                                  ),
                                                );
                                                // Tambahkan fungsi untuk menyimpan data di sini
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            icon: _buildIcon('assets/images/note_stack_add.png', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/home.png', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/view_day.png', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/account_circle.png', 3),
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

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0), // Sesuaikan padding
      child: Container(
        height: 40, // Sesuaikan tinggi agar mirip
        decoration: BoxDecoration(
          color: const Color(
              0xFFC6935A), // Warna latar belakang mirip dengan gambar
          borderRadius: BorderRadius.circular(20), // Efek rounded border
          border: Border.all(
            color: Colors.white, // Warna border putih seperti di gambar
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16), // Spasi kiri untuk teks
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Periode',
                    hintStyle: const TextStyle(
                      color: Colors.white70, // Warna hint text sesuai gambar
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none, // Hilangkan border default
                  ),
                  style:
                      const TextStyle(color: Colors.white), // Warna teks input
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                color: Colors.white, // Warna ikon putih seperti di gambar
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabaRugiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange, width: 1.5), // Border oranye
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1), // Bayangan halus
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black, // Pastikan teks tetap terlihat
                    ),
                    children: [
                      TextSpan(
                        text: 'Laba Rugi ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal), // Tidak bold
                      ),
                      TextSpan(
                        text: 'Periode 1 Jan - 31 Des 2025',
                        style: TextStyle(fontWeight: FontWeight.bold), // Bold
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Divider Oranye (Full Kanan-Kiri)
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.orange,
            ),

            // Konten dalam Padding
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris pertama (Laba Usaha Bruto & Nominal Pajak)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Laba Usaha Bruto :",
                          style: TextStyle(fontSize: 12)),
                      Text("Nominal Pajak :", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp. 1.000.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // Baris kedua (Laba Sebelum & Sesudah Pajak)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Laba Usaha (Sebelum Pajak) :",
                          style: TextStyle(fontSize: 12)),
                      Text("Laba Usaha (Sesudah Pajak) :",
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        "Rp. 100.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // Pajak & Lihat Detail dalam satu baris
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Pajak :", style: TextStyle(fontSize: 12)),
                          Text(
                            "10%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16), // Sudut tombol membulat
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          minimumSize:
                              Size(100, 30), // Ukuran tombol disesuaikan
                        ),
                        onPressed: () {},
                        child: Text(
                          "Lihat Detail",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitle(String text, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
      ),
    ),
  );
}

Widget _buildLabelAndField(String label, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isTotal
                  ? FontWeight.bold
                  : FontWeight.normal, // Bold jika isTotal true
              fontStyle: isTotal
                  ? FontStyle.italic
                  : FontStyle.normal, // Italic jika isTotal true
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 200,
          child: _buildTextField(),
        ),
      ],
    ),
  );
}

Widget _buildTextField() {
  return SizedBox(
    height: 25, // Menentukan tinggi TextField agar lebih ramping
    child: TextField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Lebih kecil
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.black54, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.black54, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Rp.0',
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      style:
          TextStyle(fontSize: 12), // Mengurangi ukuran teks agar proporsional
      keyboardType: TextInputType.number,
    ),
  );
}
