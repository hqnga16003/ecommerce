// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressUser _$AddressUserFromJson(Map<String, dynamic> json) => AddressUser(
      json['name'] as String,
      json['address'] as String,
      json['city'] as String,
      json['state'] as String,
      json['zipCode'] as String,
      json['country'] as String,
      json['idUser'] as String,
      json['isChoose'] as bool,
      AddressUser._dateTimeFromTimestamp(json['createOn'] as Timestamp),
      json['idAddress'] as String,
    );

Map<String, dynamic> _$AddressUserToJson(AddressUser instance) =>
    <String, dynamic>{
      'idAddress': instance.idAddress,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'idUser': instance.idUser,
      'isChoose': instance.isChoose,
      'createOn': AddressUser._dateTimeAsIs(instance.createOn),
    };
