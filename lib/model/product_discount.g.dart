// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDiscount _$ProductDiscountFromJson(Map<String, dynamic> json) =>
    ProductDiscount(
      json['discount'] as int,
      Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDiscountToJson(ProductDiscount instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'product': instance.product,
    };
