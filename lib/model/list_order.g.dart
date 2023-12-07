// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOrders _$ListOrdersFromJson(Map<String, dynamic> json) => ListOrders(
      ListOrders._dateTimeFromTimestamp(json['createOn'] as Timestamp),
      (json['list'] as List<dynamic>)
          .map((e) => ProductCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalPrice'] as int,
      json['uId'] as String,
      AddressUser.fromJson(json['addressUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListOrdersToJson(ListOrders instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'uId': instance.uId,
      'addressUser': instance.addressUser.toJson(),
      'createOn': ListOrders._dateTimeAsIs(instance.createOn),
    };
