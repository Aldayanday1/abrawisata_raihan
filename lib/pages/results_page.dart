import 'package:abrawisata/pages/add_page.dart';
import 'package:abrawisata/pages/add_page_3.dart';
import 'package:abrawisata/pages/home_page.dart';
import 'package:abrawisata/pages/list_page.dart';
import 'package:abrawisata/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPages extends StatefulWidget {
  ResultPages({super.key});

  @override
  State<ResultPages> createState() => _ResultPagesState();
}

class _ResultPagesState extends State<ResultPages> {
  int _selectedIndex = 0; // Sesuaikan index dengan posisi ResultPages

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

              SizedBox(height: 10),

              // Expanded untuk daftar yang bisa discroll
              // Expanded untuk daftar yang bisa discroll
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      constraints: BoxConstraints(
                        minHeight: 650,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          // SizedBox(height: 10),
                          Divider(),
                          _buildReportSection(
                              'I. Omzet / Peredaran Usaha Pendapatan',
                              'Rp. 10.000.000',
                              isValueSmall: true),
                          _buildReportSection(
                              'II. Harga Pokok Penjualan (HPP)', ''),
                          _buildIndentedField('Gaji Karyawan'),
                          _buildIndentedField('Biaya Sewa'),
                          _buildIndentedField('Biaya Promosi & Iklan'),
                          _buildIndentedField('Persediaan Akhir'),
                          _buildIndentedField('Pembelian ATK'),
                          _buildReportSection('Total HPP', 'Rp. 10.000.000',
                              isBold: true),
                          _buildReportSection(
                              'III. Laba Bruto Usaha', 'Rp. 10.000.000'),
                          _buildReportSection('IV. Beban Operasional', ''),
                          _buildIndentedField('Gaji Karyawan'),
                          _buildIndentedField('Biaya Sewa'),
                          _buildIndentedField('Biaya Promosi & Iklan'),
                          _buildIndentedField('Persediaan Akhir'),
                          _buildIndentedField('Pembelian ATK'),
                          _buildIndentedField('Transportasi'),
                          _buildIndentedField('Biaya Perbaikan'),
                          _buildIndentedField('Bunga Bank'),
                          _buildIndentedField('Biaya Telepon'),
                          _buildIndentedField('Listrik'),
                          _buildIndentedField('Biaya Penyusutan'),
                          _buildIndentedField('Biaya Lain Lain'),
                          _buildReportSection('V. Laba Usaha (Sebelum Pajak)',
                              'Rp. 10.000.000'),
                          _buildReportSection('VI. Pajak', 'Rp. 10.000.000'),
                          _buildReportSection('VII. Laba Usaha (Sesudah Pajak)',
                              'Rp. 10.000.000'),
                          SizedBox(height: 15),
                          _buildFooterButtons(context),
                        ],
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

// Widget _buildHeader() {
//   return Center(
//     child: Column(
//       children: [
//         Text(
//           'PERIODE',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           '1 JANUARI 2023 - 31 DESEMBER 2023',
//           style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//         ),
//       ],
//     ),
//   );
// }

Widget _buildHeader() {
  return Center(
    child: Image.asset(
      'assets/images/periode.png', // Sesuaikan dengan path gambar di proyek
      width: 200, // Sesuaikan ukuran gambar jika diperlukan
      height: 100,
      fit: BoxFit.contain, // Menyesuaikan ukuran gambar agar tidak terpotong
    ),
  );
}

Widget _buildReportSection(String title, String value,
    {bool isBold = false, bool isValueSmall = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isValueSmall ? 12.5 : 12.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildIndentedField(String label) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, top: 4, bottom: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
        Text(
          'Rp. 10.000.000',
          style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _buildFooterButtons(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      // Tombol Kembali
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 241, 145, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(70, 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {
          // Navigator.pop(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min, // Agar ukuran mengikuti isi tombol
          children: [
            Icon(
              Icons.edit, // Ikon edit
              size: 16, // Ukuran ikon lebih kecil
              color: Colors.white, // Warna ikon putih agar kontras
            ),
            SizedBox(width: 5), // Spasi antara ikon dan teks
            Text(
              'Edit',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 8),

      // Tombol Export
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 241, 145, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(70, 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Column(
                  children: [
                    Image.asset(
                      'assets/images/excel.png', // Pastikan file ada di folder assets
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10),
                    Text("Laporan Laba Rugi"),
                  ],
                ),
                content: Text("Periode 1 Januari - 31 Desember 2023"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("Batal"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("Ya"),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min, // Agar ukuran mengikuti isi tombol
          children: [
            Icon(
              Icons.download, // Ikon unduh
              size: 16, // Ukuran ikon lebih kecil
              color: Colors.white, // Warna ikon putih agar kontras
            ),
            const SizedBox(width: 5), // Jarak antara ikon dan teks
            const Text(
              "Export",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
