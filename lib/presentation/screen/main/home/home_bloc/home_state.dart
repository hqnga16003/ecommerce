
import 'package:ecommerce_app/model/product_discount.dart';

import '../../../../../model/product.dart';

class HomeState {}

class AllProductsLoadingState extends HomeState {}

class AllProductsLoadedState extends HomeState {
  final List<Product> listProductsNew;
  final List<Product> listProductsSale;


  AllProductsLoadedState(this.listProductsNew, this.listProductsSale,);
}

class AllProductsErrorState extends HomeState {
  final String message;

  AllProductsErrorState(this.message);
}
