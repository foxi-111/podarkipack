import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podartkipak/assets/icons/navigation_icons.dart';
import 'package:podartkipak/pages/search_page.dart';

import '../styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    "https://podarkipack.ru/img/news1.png",
    "https://podarkipack.ru/img/product-1.jpg",
    "https://podarkipack.ru/img/product-2.jpg",
    "https://podarkipack.ru/img/product-3.jpg",
  ];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      final int nextPage = controller.page!.toInt() + 1;
      if (nextPage == images.length) {
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
    return Scaffold(
        appBar: AppBar(
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
              child: Center(
                child: Row(
                  children: const [
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
        body: Container(
          color: ColorStyle.accentBackground,
          child: Column(
            children: [
              Container(
                height: 16,
                color: Colors.white,
              ),
              //Карусель
              Container(
                color: Colors.white,
                height: 185,
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index % images.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: SizedBox(
                          height: 185,
                          width: double.infinity,
                          child: Image.network(
                            images[index % images.length],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
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
                    for (var i = 0; i < images.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ),
              ),

              //Остальное
              const SizedBox(
                height: double.minPositive,
              )
            ],
          ),
        ));
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
