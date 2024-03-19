// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class KatalogModel {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "title")
    final String title;
    @JsonKey(name: "img")
    final String img;
    @JsonKey(name: "description")
    final String description;
    @JsonKey(name: "old_price")
    final String? oldPrice;
    @JsonKey(name: "now_price")
    final String nowPrice;
    @JsonKey(name: "rate")
    final int rate;
    @JsonKey(name: "is_liked")
    final bool isLiked;

    KatalogModel({
        required this.id,
        required this.title,
        required this.img,
        required this.description,
        this.oldPrice,
        required this.nowPrice,
        required this.rate,
        required this.isLiked,
    });

    KatalogModel copyWith({
        int? id,
        String? title,
        String? img,
        String? description,
        String? oldPrice,
        String? nowPrice,
        int? rate,
        bool? isLiked,
    }) => 
        KatalogModel(
            id: id ?? this.id,
            title: title ?? this.title,
            img: img ?? this.img,
            description: description ?? this.description,
            oldPrice: oldPrice ?? this.oldPrice,
            nowPrice: nowPrice ?? this.nowPrice,
            rate: rate ?? this.rate,
            isLiked: isLiked ?? this.isLiked,
        );

    factory KatalogModel.fromJson(Map<String, dynamic> json) => _$KatalogModelFromJson(json);

    Map<String, dynamic> toJson() => _$KatalogModelToJson(this);

  @override
  String toString() {
    return 'KatalogModel(id: $id, title: $title, img: $img, description: $description, oldPrice: $oldPrice, nowPrice: $nowPrice, rate: $rate, isLiked: $isLiked)';
  }
}
