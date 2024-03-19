// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KatalogModel _$KatalogModelFromJson(Map<String, dynamic> json) => KatalogModel(
      id: json['id'] as int,
      title: json['title'] as String,
      img: json['img'] as String,
      description: json['description'] as String,
      oldPrice: json['old_price'] as String?,
      nowPrice: json['now_price'] as String,
      rate: json['rate'] as int,
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$KatalogModelToJson(KatalogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'description': instance.description,
      'old_price': instance.oldPrice,
      'now_price': instance.nowPrice,
      'rate': instance.rate,
      'is_liked': instance.isLiked,
    };
