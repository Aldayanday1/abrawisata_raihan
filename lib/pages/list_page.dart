import 'package:abrawisata/pages/results_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<Map<String, String>> laporanList = [
    {
      'periode': '1 Jan - 31 Des 2025',
      'labaBruto': '1.000.000',
      'nominalPajak': '100.000',
      'labaSebelumPajak': '100.000',
      'labaSesudahPajak': '100.000',
      'pajak': '10%',
    },
    {
      'periode': '1 Jan - 31 Des 2024',
      'labaBruto': '1.000.000',
      'nominalPajak': '100.000',
      'labaSebelumPajak': '100.000',
      'labaSesudahPajak': '100.000',
      'pajak': '10%',
    },
    {
      'periode': '1 Jan - 31 Des 2023',
      'labaBruto': '1.000.000',
      'nominalPajak': '100.000',
      'labaSebelumPajak': '100.000',
      'labaSesudahPajak': '100.000',
      'pajak': '10%',
    },
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
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

              // Search Bar
              CustomSearchBar(),
              SizedBox(height: 10),

              // Expanded untuk daftar yang bisa discroll
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: List.generate(
              //           4, (index) => LabaRugiCard()), // 4 Card ke bawah
              //     ),
              //   ),
              // ),

              // Expanded untuk daftar yang bisa discroll
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6), // Padding luar
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Latar belakang putih
                        borderRadius:
                            BorderRadius.circular(12), // Sudut membulat
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2), // Bayangan halus
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(top: 5), // Padding dalam
                      child: Column(
                        children: List.generate(
                          4,
                          (index) => LabaRugiCard(), // 4 Card ke bawah
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
    );
  }
}

// Fungsi untuk membuat tampilan baris data

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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPages(),
                            ),
                          );
                        },
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
