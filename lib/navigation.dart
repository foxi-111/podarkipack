import 'package:flutter/material.dart';
import 'package:podartkipak/pages/cart_page.dart';
import 'package:podartkipak/pages/catalog_page.dart';
import 'package:podartkipak/pages/home_page.dart';
import 'package:podartkipak/pages/pick_up_page.dart';
import 'package:podartkipak/pages/profile_page.dart';

import 'assets/icons/navigation_icons.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CatalogPage(),
    PickUpPage(),
    CartPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              NavigationIcon.house,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavigationIcon.columnsgap,
            ),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavigationIcon.logo,
            ),
            label: 'Подобрать',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavigationIcon.cart2,
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              NavigationIcon.person,
            ),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(255, 153, 123, 1),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
