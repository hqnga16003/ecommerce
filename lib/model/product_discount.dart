
import 'package:ecommerce_app/model/product.dart';
import 'package:json_annotation/json_annotation.dart';


part 'product_discount.g.dart';

@JsonSerializable()
class ProductDiscount {
  final int discount;
  final Product product;

  ProductDiscount(this.discount, this.product);


  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDiscountToJson(this);
}