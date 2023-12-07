import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String idProduct;
  String imgProduct;
   String nameProduct;
   String categoryProduct;
   int numberReviews;
   int numberRating;
   String branchProduct;
   double priceProduct;
   int discount;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime createAt;

  Product(this.numberReviews, this.branchProduct, this.numberRating,
      this.priceProduct, this.imgProduct, this.nameProduct, this.discount, this.createAt, this.idProduct,
      {required this.categoryProduct});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  static DateTime _dateTimeAsIs(DateTime dateTime) => dateTime;  //<-- pass through no need for generated code to perform any formatting

  Map<String, dynamic> toJson() => _$ProductToJson(this);
  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
}
