import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/product_discount.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_bloc/home_event.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_bloc/home_state.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';

@Singleton()
@injectable
class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  List<Category> listCategories = [];
  List<Product> listProduct = [];

  ShopBloc(this.firebaseFireStoreRepository) : super(ShopState()) {
    on<GetAllCategories>((event, emit) async {
      try {
        emit(AllDataLoadingState());
        listCategories = await firebaseFireStoreRepository.getAllCategories();
        emit(AllDataLoadedState(listCategories));
      } catch (e) {
        emit(AllDataErrorState(e.toString()));
      }
    });
    on<ChangeListViewProducts>((event, emit) async {
      if (event.isGrid == true) {
        emit(GridViewState());
      } else {
        emit(ListViewState());
      }
    });

    on<GetProductsByCategory>((event, emit) async {
      listProduct = await firebaseFireStoreRepository
          .getProductsByCategory(event.nameCategory);
      emit(GetProductLoadedState(event.nameCategory));
    });
    on<FiltersListProductEvent>((event, emit) async {
      List<Product> filteredProducts = [];
      for (var element in listProduct) {
        if(element.priceProduct >= event.priceStart && element.priceProduct<=event.priceEnd){
          filteredProducts.add(element);
        }
      }
      emit(FilteredProductsState(filteredProducts));
    });
    on<SortListProductView>((event, emit) async {
      switch (event.nameSort) {
        case "Popular":
          print("Popular");
          break;
        case "Newest":
          print("Newest");
          break;
        case "Customer review":
          listProduct.sort((a, b) {
            return a.numberReviews.compareTo(b.numberReviews);

          });
          emit(ProductSortListViewState(listProduct,"Customer review"));
          break;
        case "Price: lowest to high":


          listProduct.sort((a, b) {
            double discountedPriceA =
                a.priceProduct - (a.priceProduct * (a.discount ?? 0) / 100);
            double discountedPriceB =
                b.priceProduct - (b.priceProduct * (b.discount ?? 0) / 100);
            if (discountedPriceA != discountedPriceB) {
              return discountedPriceA.compareTo(discountedPriceB);
            } else {
              return a.priceProduct.compareTo(b.priceProduct);
            }
          });
          emit(ProductSortListViewState(listProduct,"Price: lowest to high"));
          break;
        case "word-wrap: break-word":
          print("word-wrap: break-word");
          break;
      }
    });
  }
}
