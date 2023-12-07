// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewProduct _$ReviewProductFromJson(Map<String, dynamic> json) =>
    ReviewProduct(
      json['idUserReview'] as String,
      json['idProduct'] as String,
      json['content'] as String,
      json['rating'] as int,
      ReviewProduct._dateTimeFromTimestamp(json['createAt'] as Timestamp),
      (json['img'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReviewProductToJson(ReviewProduct instance) =>
    <String, dynamic>{
      'idUserReview': instance.idUserReview,
      'idProduct': instance.idProduct,
      'content': instance.content,
      'rating': instance.rating,
      'img': instance.img,
      'createAt': ReviewProduct._dateTimeAsIs(instance.createAt),
    };
