import 'package:json_annotation/json_annotation.dart';

part 'model_second.g.dart';

@JsonSerializable()
class ModelSecond {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "img")
  final String img;

  ModelSecond({
    required this.id,
    required this.title,
    required this.img,
  });

  ModelSecond copyWith({
    int? id,
    String? title,
    String? img,
  }) =>
      ModelSecond(
        id: id ?? this.id,
        title: title ?? this.title,
        img: img ?? this.img,
      );

  factory ModelSecond.fromJson(Map<String, dynamic> json) =>
      _$ModelSecondFromJson(json);

  Map<String, dynamic> toJson() => _$ModelSecondToJson(this);
}
