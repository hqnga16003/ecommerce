import 'package:ecommerce_app/model/product.dart';

import '../../../../../model/category.dart';

class ShopState {}

class AllDataLoadingState extends ShopState {}

class AllDataLoadedState extends ShopState {
  final List<Category> listCategories;

  AllDataLoadedState(this.listCategories);
}

class GridViewState extends ShopState {}

class ListViewState extends ShopState {}

class ProductSortListViewState extends ShopState {
  final List<Product> list;
  final String nameSort;
  ProductSortListViewState(this.list, this.nameSort);
}

class FilteredProductsState  extends ShopState {
  final List<Product> list ;
  FilteredProductsState (this.list);
}


class AllDataErrorState extends ShopState {
  final String message;

  AllDataErrorState(this.message);
}

class GetProductLoadingState extends ShopState {}

class GetProductLoadedState extends ShopState {
  final String nameCategory;

  GetProductLoadedState(this.nameCategory);
}

class GetProductErrorState extends ShopState {}
