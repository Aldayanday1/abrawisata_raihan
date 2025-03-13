import 'package:flutter/material.dart';
import 'pages/list_page.dart';
import 'pages/home_page.dart';
import 'pages/add_page.dart';
import 'pages/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    AddPage(),
    HomePage(),
    ListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
      body: _pages[_selectedIndex],
    );
  }

  // Fungsi untuk membuat ikon dengan warna yang sesuai status pemilihan
  Widget _buildIcon(String assetPath, int index) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _selectedIndex == index ? Colors.black : Colors.grey, // Warna dinamis
        BlendMode.srcIn,
      ),
      child: Image.asset(assetPath, width: 24, height: 24),
    );
  }
}
