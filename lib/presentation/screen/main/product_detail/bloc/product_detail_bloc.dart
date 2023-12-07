import 'package:ecommerce_app/model/review_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';
import '../../../../../model/product.dart';

abstract class ProductDetailEvent {}

class GetReviewsEvent extends ProductDetailEvent {
  final String idProduct;

  GetReviewsEvent(this.idProduct);
}

class AddProductToCart extends ProductDetailEvent {
  final Product product;
  final String size;
  final String color;

  AddProductToCart(this.product, this.size, this.color);
}

class ProductDetailState {}

class ProductDetailDataLoadingState extends ProductDetailState {}

class ProductDetailDataLoadedState extends ProductDetailState {
  final List<ReviewProduct> list;
  final double rating;
  final int numberReviews;

  ProductDetailDataLoadedState(this.list, this.rating, this.numberReviews);
}

class ProductDetailDataErrorState extends ProductDetailState {
  final String err;

  ProductDetailDataErrorState(this.err);
}

class AddProductToCartSuccess extends ProductDetailState {}

class AddProductToCartFail extends ProductDetailState {}

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  int totalQuantityRating = 0;
  int numberReviews = 0;
  double rating = 0.0;

  ProductDetailBloc(this.firebaseFireStoreRepository)
      : super(ProductDetailState()) {
    on<GetReviewsEvent>((event, emit) async {
      emit(ProductDetailDataLoadingState());

      try {
        final listReview = await firebaseFireStoreRepository
            .getReviewProductById(event.idProduct);
        if (listReview.isEmpty) {
          emit(ProductDetailDataLoadedState(listReview, 0, 0));
        } else {
          totalQuantityRating = listReview.length;
          numberReviews = listReview.fold(
            0,
            (sum, element) => sum + element.rating.toInt(),
          );
          rating = numberReviews / totalQuantityRating;
          emit(ProductDetailDataLoadedState(
              listReview, rating, totalQuantityRating));
        }
      } catch (e) {
        emit(ProductDetailDataErrorState(e.toString()));
      }
    });
    on<AddProductToCart>((event, emit) async {
      try {
        firebaseFireStoreRepository.addToCart(event.product, event.size,event.color);
      } catch (e) {
      }
    });
  }
}
