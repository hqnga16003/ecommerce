import '../../../../../model/product.dart';

abstract class ShopEvent {}

class GetProductsEvent extends ShopEvent {
  final String nameCategory;

  GetProductsEvent(this.nameCategory);
}

class ChangeViewProductsEvent extends ShopEvent {

}
class SortListProductEvent extends ShopEvent {
  final String nameSort;
  SortListProductEvent(this.nameSort);
}

class FiltersProductsEvent extends ShopEvent {
  final double priceStart;
  final double priceEnd;
  final List<String> colors;
  final List<String> sizes;
  final List<String> categories;
  final List<String> brands;

  FiltersProductsEvent(this.priceStart, this.priceEnd, this.colors,
      this.sizes, this.categories, this.brands);
}


class AddToCartEvent extends ShopEvent {
  final Product product;

  AddToCartEvent(this.product);
}


