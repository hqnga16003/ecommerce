// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCart _$ProductCartFromJson(Map<String, dynamic> json) => ProductCart(
      Product.fromJson(json['product'] as Map<String, dynamic>),
      json['size'] as String,
      json['quantity'] as int,
      json['idCustomer'] as String,
      json['color'] as String,
    );

Map<String, dynamic> _$ProductCartToJson(ProductCart instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'idCustomer': instance.idCustomer,
      'size': instance.size,
      'color': instance.color,
      'quantity': instance.quantity,
    };
