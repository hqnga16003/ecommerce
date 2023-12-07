import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/address.dart';
import 'package:ecommerce_app/model/product_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_order.g.dart';

@JsonSerializable(explicitToJson: true)
class ListOrders {
  final List<ProductCart> list;
  final int totalPrice;
  final String uId;
  final AddressUser addressUser;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime createOn;

  ListOrders(this.createOn, this.list, this.totalPrice, this.uId, this.addressUser);


  factory ListOrders.fromJson(Map<String, dynamic> json) =>
      _$ListOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$ListOrdersToJson(this);

  static DateTime _dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
}
