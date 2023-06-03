class PopularProduct {
  final String title;
  final String url;
  final int price;
  final int priceDiscount;
  final int discount;

  PopularProduct({
    required this.title,
    required this.url,
    required this.price,
    required this.priceDiscount,
    required this.discount,
  });

  static PopularProduct fromJson(json) => PopularProduct(
        title: json['Title'],
        url: json['Url'],
        price: json['Price'],
        priceDiscount: json['PriceDiscount'],
        discount: json['Discount'],
      );
}
