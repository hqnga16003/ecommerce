import 'package:ecommerce_app/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_cart.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductCart {
  final Product product;
  final String idCustomer;
  final String size;
  final String color;
  int quantity;

  ProductCart(this.product, this.size, this.quantity, this.idCustomer, this.color);

  factory ProductCart.fromJson(Map<String, dynamic> json) =>
      _$ProductCartFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartToJson(this);
}
