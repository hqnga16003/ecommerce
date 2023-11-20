// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['numberReviews'] as int,
      json['branchProduct'] as String,
      json['numberRating'] as int,
      (json['priceProduct'] as num).toDouble(),
      json['imgProduct'] as String,
      json['nameProduct'] as String,
      json['discount'] as int,
      categoryProduct: json['categoryProduct'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'imgProduct': instance.imgProduct,
      'nameProduct': instance.nameProduct,
      'categoryProduct': instance.categoryProduct,
      'numberReviews': instance.numberReviews,
      'numberRating': instance.numberRating,
      'branchProduct': instance.branchProduct,
      'priceProduct': instance.priceProduct,
      'discount': instance.discount,
    };
