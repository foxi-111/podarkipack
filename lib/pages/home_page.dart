import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podartkipak/assets/icons/navigation_icons.dart';
import 'package:podartkipak/models/category_model.dart';
import 'package:podartkipak/models/stock_model.dart';
import 'package:podartkipak/pages/search_page.dart';

import '../models/popular_products.dart';
import '../styles/colors.dart';
import '../styles/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categorys> categories = getCategories();

  static List<Categorys> getCategories() {
    const data = [
      {
        "Title": "Маме",
      },
      {
        "Title": "Папе",
      },
      {
        "Title": "Жене",
      },
      {
        "Title": "Бабушке",
      },
    ];
    return data.map<Categorys>(Categorys.fromJson).toList();
  }

  List<Stock> stocks = getStocks();

  static List<Stock> getStocks() {
    const data = [
      {
        "Url": "https://podarkipack.ru/img/news1.png",
      },
      {
        "Url": "https://podarkipack.ru/img/product-1.jpg",
      },
      {
        "Url": "https://podarkipack.ru/img/product-2.jpg",
      },
      {
        "Url": "https://podarkipack.ru/img/product-3.jpg",
      },
    ];
    return data.map<Stock>(Stock.fromJson).toList();
  }

  static List<PopularProduct> popularProducts = getPopularProducts();

  static List<PopularProduct> getPopularProducts() {
    const data = [
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-1.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-2.jpg",
        "Price": 1500,
        "PriceDiscount": 0,
        "Discount": 0,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-3.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
      },
      {
        "Title": "Подарочный набор №1, лучший набор для девушек и...",
        "Url": "https://podarkipack.ru/img/product-1.jpg",
        "Price": 1500,
        "PriceDiscount": 1250,
        "Discount": 25,
      },
    ];
    return data.map<PopularProduct>(PopularProduct.fromJson).toList();
  }

  int currentIndex = 0;
  final PageController controller = PageController();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (Timer t) {
      final int nextPage = controller.page!.toInt() + 1;
      if (nextPage == stocks.length) {
        controller.jumpToPage(0);
      } else {
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // show the snackbar with some text
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The System Back Button is Deactivated!')));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: Colors.white, // фон должен быть непрозрачным цветом
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: ColorStyle.gradient, // устанавливаем градиент в фон
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7),
                      child:
                          Icon(Icons.search, color: ColorStyle.theTextIsGray),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Найти подарок',
                        style: TextStyle(
                            fontSize: 15, color: ColorStyle.theTextIsGray),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          actions: [
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
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index % stocks.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    final stock = stocks[index % stocks.length];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: SizedBox(
                          height: 185,
                          width: double.infinity,
                          child: Image.network(
                            ///
                            stock.url,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress != null) {
                                return Container(
                                  color: const Color.fromRGBO(234, 234, 234, 1),
                                  child: const Center(
                                    child: Text(
                                      'НОВОСТЬ\nЗАГРУЖАЕТСЯ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color:
                                              Color.fromRGBO(130, 130, 130, 1),
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                );
                              } else {
                                return child;
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 4,
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < stocks.length; i++)
                    buildIndicator(currentIndex == i)
                ],
              ),
            ),

            const SizedBox(
              height: 7,
            ),

            Container(
              color: Colors.white,
              height: 90,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Самые популярные категории:',
                      style: Style.textAccent,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 4,
                          maxCrossAxisExtent: double.infinity,
                          crossAxisSpacing: 24,
                          mainAxisExtent: 100,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Container(
                            margin: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                                gradient: ColorStyle
                                    .gradient, // устанавливаем градиент в фон
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            width: 70,
                            height: 24,
                            child: Center(
                                child: Text(
                              category.title,
                              style: fontSized(category.title),
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Остальное
            const SizedBox(
              height: 7,
            ),

            Container(
              height: 450,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 20),
                    child: Text(
                      'Популярные товары:',
                      style: Style.textAccent,
                    ),
                  ),
                  //Список популярных товаров
                  // Expanded(
                  //   child: GridView.builder(
                  //     itemCount: popularProducts.length,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisSpacing: 10,
                  //       mainAxisSpacing: 10,
                  //       crossAxisCount: 2,
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       final popularProduct = popularProducts[index];
                  //       return containerPopularProduct(
                  //           popularProduct.title,
                  //           popularProduct.url,
                  //           popularProduct.price,
                  //           popularProduct.priceDiscount,
                  //           popularProduct.discount);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerPopularProduct(
      String title, String url, int price, int priceDicount, int discount) {
    if (discount == 0) {
      return Container(
        height: 250,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 173,
                width: 173,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(url),
                ),
              ),
            ),
            Text(
              '$price',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 173,
                width: 173,
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(url),
                ),
              ),
            ),
            Text(
              '$price',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      );
    }
  }

  //Подсчет количество букв кждой категории и изменения размера шрифта
  static TextStyle fontSized(String text) {
    if (text.length <= 4) {
      return const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    } else if (text.length >= 5 && text.length <= 7) {
      return const TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold);
    } else {
      return const TextStyle(
          color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold);
    }
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        height: isSelected ? 8 : 8,
        width: isSelected ? 8 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? ColorStyle.colorTwo : ColorStyle.isNoSelected,
        ),
      ),
    );
  }
}
