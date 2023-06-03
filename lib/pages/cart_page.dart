import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podartkipak/customizable/my_elevated_buttom.dart';

import '../assets/icons/navigation_icons.dart';
import '../models/cart.dart';
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
        title: const Text('Корзина'),
        centerTitle: true,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.white, // фон должен быть непрозрачным цветом
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorStyle.gradient, // устанавливаем градиент в фон
          ),
        ),
      ),
      body: const CartFull(),
    );
  }
}

class CartFull extends StatefulWidget {
  const CartFull({super.key});

  @override
  State<CartFull> createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  List<Cart> carts = getCategories();

  static List<Cart> getCategories() {
    const data = [
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-3.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
        "Count": 1,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-3.jpg",
        "Price": 1500,
        "PriceDiscount": 0,
        "Discount": 0,
        "Count": 1,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-3.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
        "Count": 1,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-3.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
        "Count": 1,
      },
    ];
    return data.map<Cart>(Cart.fromJson).toList();
  }

  int summ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Список
          Expanded(
            child: ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Container(
                    height: 163,
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 18),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(cart.url),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                margin:
                                    const EdgeInsets.only(left: 10, top: 18),
                                child: Text(
                                  cart.title,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                height: 54,
                                width: 150,
                                child: priceDiscount(cart.price,
                                    cart.priceDiscount, cart.discount),
                              )
                            ],
                          ),
                          Container(
                            width: 50,
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.count++;
                                      if (cart.discount == 0) {
                                        summ += cart.price;
                                      } else {
                                        summ += cart.priceDiscount;
                                      }
                                    });
                                  },
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            ColorStyle.colorOne,
                                            ColorStyle.colorTwo,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0))),
                                    child: const Icon(
                                      NavigationIcon.plus,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${cart.count}',
                                  style: const TextStyle(fontSize: 24),
                                ),
                                RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.count--;
                                      if (cart.count <= 0) {
                                        carts.removeAt(index);
                                      } else if (cart.discount == 0) {
                                        summ -= cart.price;
                                      } else {
                                        summ -= cart.priceDiscount;
                                      }
                                    });
                                  },
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            ColorStyle.colorOne,
                                            ColorStyle.colorTwo,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0))),
                                    child: const Icon(
                                      NavigationIcon.plus,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                //Сумма по заказу
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 8, right: 16, bottom: 10),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Сумма заказа',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: '$summ,',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: '00 руб.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            )
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Доставка',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('БЕСПЛАТНО',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'К оплате',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '300,',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '00 руб.',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ])),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Бонусов к начислению',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('20П',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //Кнопка оформить заказ
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MyElevatedButton(
                      onPressed: () {},
                      width: 225,
                      borderRadius: BorderRadius.circular(25),
                      height: 40,
                      child: const Text(
                        'Оформить заказ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static RichText priceDiscount(int price, int priceDicount, int discount) {
    if (discount == 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$price ₽ ',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$priceDicount ₽ ',
              style: const TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '$price ₽',
              style: const TextStyle(
                fontSize: 17,
                color: Color.fromRGBO(130, 130, 130, 1),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      );
    }
  }
}

class CartNull extends StatelessWidget {
  const CartNull({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        //Текст
        //Кнопка перейти в каталог
        );
  }
}
