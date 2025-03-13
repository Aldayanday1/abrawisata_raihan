import 'package:abrawisata/pages/list_page.dart';
import 'package:abrawisata/pages/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none, // Agar widget bisa keluar dari batas parent
          children: [
            Column(
              children: [
                // HEADER
                Container(
                  padding: EdgeInsets.only(
                      top: 80, left: 50, right: 50, bottom: 100),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade300, Colors.yellow],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bagian Selamat Datang & Profil
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang!',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'CV. Abra Wisata',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white70),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 25, // Sesuaikan ukuran avatar
                            backgroundColor:
                                Colors.white, // Warna latar belakang
                            // backgroundImage: AssetImage(
                            //     'lib/images/profile.png'), // Gunakan gambar dari assets
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Tambahan konten di bawah (jika ada)
                SizedBox(height: 65), // Beri ruang agar tidak tertimpa
                // Container(
                //   padding: EdgeInsets.all(20),
                //   child: Text(
                //       "Konten Lainnya..."), // Placeholder konten di bawahnya
                // ),
                LabaRugiCard(),
                GrafikCard(),

                SizedBox(height: 40),
              ],
            ),

            // CONTAINER INFOCARD YANG KELUAR DARI HEADER
            Positioned(
              top: 160, // Atur posisi agar keluar dari header
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 0), // 🔹 Hapus padding horizontal
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Periode + Dropdown
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 22.0, right: 22, bottom: 5, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // 🔹 Pastikan posisi rata tengah
                        children: [
                          Text(
                            'Periode 2025',
                            style: TextStyle(
                              fontSize: 14, // 🔹 Kecilkan sedikit jika perlu
                              fontWeight: FontWeight.bold,
                              height: 1.0, // 🔹 Kurangi jarak vertikal default
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // 🔹 Rapatkan elemen dalam Row
                            children: [
                              Text(
                                'Pilih Periode',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                  height: 1.0, // 🔹 Kurangi jarak antar teks
                                ),
                              ),
                              SizedBox(
                                  width:
                                      3), // 🔹 Kurangi jarak teks ke dropdown
                              DropdownButton<String>(
                                value: '',
                                isDense: true, // 🔹 Buat dropdown lebih kecil
                                underline:
                                    Container(), // 🔹 Hilangkan garis bawah dropdown
                                icon:
                                    Icon(Icons.arrow_drop_down_circle_outlined),
                                onChanged: (String? newValue) {
                                  // Handle perubahan periode
                                },
                                items: [''].map((String period) {
                                  return DropdownMenuItem<String>(
                                    value: period,
                                    child: Text(period,
                                        style: TextStyle(
                                            fontSize:
                                                12)), // 🔹 Sesuaikan ukuran teks
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 🔹 Garis FULL Width (Hitam)
                    SizedBox(height: 5), // 🔹 Beri sedikit jarak atas
                    Container(
                      width: MediaQuery.of(context)
                          .size
                          .width, // 🔹 Ambil lebar layar penuh
                      height: 0.5, // 🔹 Lebih tebal agar terlihat jelas
                      color: Colors.black, // 🔹 Warna hitam
                    ),
                    SizedBox(height: 10), // 🔹 Jarak setelah garis

                    // Info Cards (Pemasukan & Pengeluaran)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 15, top: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: InfoCard(
                              title: 'Pemasukan',
                              amount: 'Rp.1.700.000',
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InfoCard(
                              title: 'Pengeluaran',
                              amount: 'Rp.1.700.000',
                              color: Colors.yellow.shade700,
                            ),
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
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  InfoCard({required this.title, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(10), // Lengkungan pada setiap kartu
        ),
        child: Column(
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              amount,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class InfoSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Laba Rugi Periode 1 Jan - 31 Des 2025',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text('Laba Usaha Bruto : Rp. 1.000.000'),
//             Text('Laba Usaha (Sebelum Pajak) : Rp. 100.000'),
//             Text('Pajak : 10%'),
//             Text('Nominal Pajak : Rp. 100.000'),
//             Text('Laba Usaha (Sesudah Pajak) : Rp. 100.000'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GraphSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Grafik Laba Usaha',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             // SizedBox(
//             //   height: 200,
//             //   child: LineChart(
//             //     LineChartData(
//             //       gridData: FlGridData(show: false),
//             //       titlesData: FlTitlesData(show: true),
//             //       borderData: FlBorderData(show: false),
//             //       lineBarsData: [
//             //         LineChartBarData(
//             //           spots: [
//             //             FlSpot(2020, 50),
//             //             FlSpot(2021, 75),
//             //             FlSpot(2022, 60),
//             //             FlSpot(2023, 40),
//             //             FlSpot(2024, 20),
//             //           ],
//             //           isCurved: true,
//             //           colors: [Colors.blue],
//             //           dotData: FlDotData(show: false),
//             //           belowBarData: BarAreaData(show: false),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LabaRugiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Laba Rugi",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              Text(
                "Periode 1 Jan - 31 Des 2025",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 1),

          // Isi Data
          buildLabaItem("Laba Usaha Bruto", "Rp. 1.000.000", true),
          buildLabaItem("Laba Usaha (Sebelum Pajak)", "Rp. 100.000", true),
          buildLabaItem("Pajak", "10%", true),
          buildLabaItem("Nominal Pajak", "Rp. 100.000", true),
          buildLabaItem("Laba Usaha (Sesudah Pajak)", "Rp. 100.000", true),
        ],
      ),
    );
  }

  // Widget untuk menampilkan baris teks
  Widget buildLabaItem(String title, String amount, bool isBold) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12.5)),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan grafik
class GrafikCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Grafik Laba Usaha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/images/grafik.png', // Pastikan gambar berada di folder ini
            fit: BoxFit.cover, // Agar gambar menyesuaikan container
          ),
          // AssetImage('assets/images/profile.png'),
        ],
      ),
    );
  }
}
