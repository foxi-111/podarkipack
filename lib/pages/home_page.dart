import 'package:flutter/material.dart';
import 'package:podartkipak/assets/icons/navigation_icons.dart';
import 'package:podartkipak/pages/search_page.dart';

import '../styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // фон должен быть непрозрачным цветом
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorStyle.gradient, // устанавливаем градиент в фон
          ),
        ),
        title: const Text('ПОДАРКИ ПАК'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchPage()));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          RawMaterialButton(
            onPressed: () {},
            constraints: BoxConstraints.tight(const Size(32, 32)),
            elevation: 2.0,
            fillColor: Colors.white,
            shape: const CircleBorder(),
            child: const Icon(
              NavigationIcon.notification,
              size: 20.0,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Home page!'),
      ),
    );
  }
}
