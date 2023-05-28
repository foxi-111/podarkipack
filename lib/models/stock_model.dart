class Stock {
  final String url;

  const Stock({required this.url});

  static Stock fromJson(json) => Stock(
        url: json['Url'],
      );
}
