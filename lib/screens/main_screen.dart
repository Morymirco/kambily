import 'package:flutter/material.dart';
import 'package:kambily/screen/home_page.dart';

import 'account_screen.dart';
import 'categories_screen.dart';
import 'contact_screen.dart';
import 'shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  
  final List<Widget> _screens = [
    const MyHomePage(title: 'Kambily'),
    const ShopScreen(),
    const CategoriesScreen(),
    const ContactScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF048B9A),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 28),
            label: 'ACCUEIL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 28),
            label: 'BOUTIQUE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 28),
            label: 'CATÉGORIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic, size: 28),
            label: 'CONTACT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin, size: 28),
            label: 'COMPTE',
          ),
        ],
      ),
    );
  }
} 