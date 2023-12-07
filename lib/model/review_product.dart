import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/product_cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_product.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewProduct {
  final String idUserReview;
  final String idProduct;
  final String content;
  final int rating;
  final List<String> img;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime createAt;

  ReviewProduct(
    this.idUserReview,
    this.idProduct,
    this.content,
    this.rating,
    this.createAt,
    this.img,
  );

  factory ReviewProduct.fromJson(Map<String, dynamic> json) =>
      _$ReviewProductFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewProductToJson(this);

  static DateTime _dateTimeAsIs(DateTime dateTime) => dateTime;

  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
}
