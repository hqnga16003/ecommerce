import 'package:ecommerce_app/model/product.dart';

import '../../../../../model/category.dart';

class ShopState {}

class ProductsLoadingState extends ShopState {}

class ProductsLoadedState  extends ShopState {
  final List<Product> listProduct ;
  final String title;
  ProductsLoadedState(this.listProduct, this.title);
}
class ProductsErrorState  extends ShopState {
  final String err;
  ProductsErrorState(this.err);
}


