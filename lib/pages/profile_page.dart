import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        backgroundColor: Colors.white, // фон должен быть непрозрачным цветом
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorStyle.gradient, // устанавливаем градиент в фон
          ),
        ),
      ),
      body: const Center(
        child: Text('Profile page!'),
      ),
    );
  }
}
