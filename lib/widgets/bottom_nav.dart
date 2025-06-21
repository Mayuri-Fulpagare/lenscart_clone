import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/explore_page.dart';
import '../pages/tryon_page.dart';
import '../pages/eyecare_page.dart';
import '../pages/orders_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    ExplorePage(),
    TryOnPage(),
    EyecarePage(),
    OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Color(0xFF5dccd8),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: '3D Try On'),
          BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Eyecare'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Orders'),
        ],
      ),
    );
  }
}
