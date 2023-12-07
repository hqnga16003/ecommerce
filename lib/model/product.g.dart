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
      Product._dateTimeFromTimestamp(json['createAt'] as Timestamp),
      json['idProduct'] as String,
      categoryProduct: json['categoryProduct'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'idProduct': instance.idProduct,
      'imgProduct': instance.imgProduct,
      'nameProduct': instance.nameProduct,
      'categoryProduct': instance.categoryProduct,
      'numberReviews': instance.numberReviews,
      'numberRating': instance.numberRating,
      'branchProduct': instance.branchProduct,
      'priceProduct': instance.priceProduct,
      'discount': instance.discount,
      'createAt': Product._dateTimeAsIs(instance.createAt),
    };
