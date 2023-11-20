abstract class ShopEvent {}
class GetAllCategories extends ShopEvent {}
class ChangeListViewProducts extends ShopEvent{
  final bool isGrid;
  ChangeListViewProducts(this.isGrid);
}

class GetProductsByCategory extends ShopEvent{
  final String nameCategory;
  GetProductsByCategory(this.nameCategory);
}

class SortListProductView extends ShopEvent{
  final String nameSort;
  SortListProductView(this.nameSort);
}
class FiltersListProductEvent extends ShopEvent{
  final double priceStart;
  final double priceEnd;
  FiltersListProductEvent(this.priceStart, this.priceEnd);
}