import 'package:flutter/material.dart';

import '../styles/colors.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({super.key});

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> {
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
        child: Text('Pick up page!'),
      ),
    );
  }
}
