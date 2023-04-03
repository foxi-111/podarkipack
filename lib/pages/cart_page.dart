import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
        child: Text('Cart page!'),
      ),
    );
  }
}
