class Categorys {
  final String title;

  const Categorys({
    required this.title,
  });

  static Categorys fromJson(json) => Categorys(
        title: json['Title'],
      );
}
