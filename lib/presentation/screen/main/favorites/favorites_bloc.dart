import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/firebase_firestore_repository.dart';
import '../../../../model/product.dart';

class FavoritesState {}

class FavoritesLoading extends FavoritesState {
}

class FavoritesLoaded extends FavoritesState {

}

class FavoritesError extends FavoritesState {
}

class FavoritesEvent {}

class AddFavoriteEvent extends FavoritesEvent {
  final Product product;
  final String size,color;

  AddFavoriteEvent(this.product, this.size, this.color);
}

@injectable
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;

  FavoritesBloc(this.firebaseFireStoreRepository) : super(FavoritesState()) {
    on<AddFavoriteEvent>((event, emit) async {
      firebaseFireStoreRepository.addFavorite(event.product, event.size, event.color);
      emit(FavoritesLoaded());
    });
  }


}
