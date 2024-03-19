// ignore_for_file: public_member_api_docs, sort_constructors_first
class KatalogEntities {
  final int id;
  final String title;
  final String img;
  final String description;
  final String? oldPrice;
  final String nowPrice;
  final int rate;
  final bool isLiked;
  KatalogEntities({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    this.oldPrice,
    required this.nowPrice,
    required this.rate,
    required this.isLiked,
  });
}

class KatalogSecond {
  final int id;
  final String title;
  final String img;
  KatalogSecond({
    required this.id,
    required this.title,
    required this.img,
  });
}
