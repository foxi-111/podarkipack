class Cart {
  final String title;
  final String url;
  final int price;
  final int priceDiscount;
  final int discount;
  int count;

  Cart({
    required this.title,
    required this.url,
    required this.price,
    required this.priceDiscount,
    required this.discount,
    required this.count,
  });

  static Cart fromJson(json) => Cart(
        title: json['Title'],
        url: json['Url'],
        price: json['Price'],
        priceDiscount: json['PriceDiscount'],
        discount: json['Discount'],
        count: json['Count'],
      );
}
