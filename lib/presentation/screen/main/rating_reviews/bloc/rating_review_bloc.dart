import 'package:ecommerce_app/model/review_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';

abstract class RatingReviewEvent {}

class AddReviewEvent extends RatingReviewEvent {
  final ReviewProduct reviewProduct;
  final int currentRating;

  AddReviewEvent(this.reviewProduct, this.currentRating);
}

class RatingReviewState {}

class RatingReviewReloadState extends RatingReviewState {
  final List<ReviewProduct> list;
  final double rating;
  final int numberReviews;

  RatingReviewReloadState(this.list, this.rating, this.numberReviews);
}

@injectable
class RatingReviewBloc extends Bloc<RatingReviewEvent, RatingReviewState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;

  RatingReviewBloc(this.firebaseFireStoreRepository)
      : super(RatingReviewState()) {
    on<AddReviewEvent>((event, emit) async {
      await firebaseFireStoreRepository.addReviewProduct(event.reviewProduct);

      final listReview = await firebaseFireStoreRepository
          .getReviewProductById(event.reviewProduct.idProduct);
      int totalQuantityRating = listReview.length;
      int numberReviews = listReview.fold(
        0,
        (sum, element) => sum + element.rating.toInt(),
      );
      double rating = numberReviews / totalQuantityRating;
      if(rating!=event.currentRating){
        firebaseFireStoreRepository.updateNumberRatingProduct(event.reviewProduct.idProduct,rating.toInt());
      }
      emit(RatingReviewReloadState(listReview, rating, totalQuantityRating));
    });
  }
}
