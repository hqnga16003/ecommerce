
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/firebase_firestore_repository.dart';

@Singleton()
@injectable
class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  List<Product> listProduct = [];
  String nameSort = "Price: lowest to high";

  ShopBloc(this.firebaseFireStoreRepository) : super(ShopState()) {
    on<GetProductsEvent>((event, emit) async {
      nameSort = "Price: lowest to high";
      emit(ProductsLoadingState());
      try {
        listProduct = await firebaseFireStoreRepository
            .getProductsByCategory(event.nameCategory);
        emit(ProductsLoadedState(
            listProduct, nameSort));

      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });


    on<ChangeViewProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      emit(ProductsLoadedState(listProduct, nameSort));
    });



    on<SortListProductEvent>((event, emit) async {
      switch (event.nameSort) {
        case "Popular":
          nameSort = "Popular";
          emit(ProductsLoadingState());
          emit(ProductsLoadedState(listProduct, nameSort));
          break;
        case "Newest":
          nameSort = "Newest";
          emit(ProductsLoadingState());
          emit(ProductsLoadedState(listProduct, nameSort));
          break;
        case "Customer review":
          nameSort = "Customer review";
          emit(ProductsLoadingState());
          listProduct.sort((a, b) {
            return a.numberReviews.compareTo(b.numberReviews);
          });
          emit(
              ProductsLoadedState(listProduct, nameSort));

          break;
        case "Price: lowest to high":
          nameSort = "Price: lowest to high";

          emit(ProductsLoadingState());

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
          emit(ProductsLoadedState(
              listProduct, nameSort));
          break;
        case "word-wrap: break-word":
          nameSort = "word-wrap: break-word";
          emit(ProductsLoadingState());

          emit(ProductsLoadedState(
              listProduct, nameSort));
          break;
      }
    });
  //
    on<FiltersProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      List<Product> filteredProducts = [];
      for (var element in listProduct) {
        if (element.priceProduct >= event.priceStart &&
            element.priceProduct <= event.priceEnd) {
          if(event.brands.isNotEmpty){
            if(event.brands.contains(element.branchProduct)){
              filteredProducts.add(element);
            }
          }else{
            filteredProducts.add(element);

          }
        }
      }
      listProduct = filteredProducts;
      emit(ProductsLoadedState(
          filteredProducts, nameSort));
    });
   }


}
