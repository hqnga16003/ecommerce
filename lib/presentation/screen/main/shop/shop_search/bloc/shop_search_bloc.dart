import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../data/firebase_firestore_repository.dart';
import '../../../../../../model/category.dart';

abstract class ShopSearchEvent {}

class GetAllCategoriesEvent extends ShopSearchEvent {}

class ShopSearchState {}

class GetAllCategoriesLoadingState extends ShopSearchState {}

class GetAllCategoriesLoadedState extends ShopSearchState {
  final List<Category> listCategories;

  GetAllCategoriesLoadedState(this.listCategories);
}

class GetAllCategoriesErrorState extends ShopSearchState {
  final String err;

  GetAllCategoriesErrorState(this.err);
}

@Singleton()
@injectable
class ShopSearchBloc extends Bloc<ShopSearchEvent, ShopSearchState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;

  ShopSearchBloc(this.firebaseFireStoreRepository) : super(ShopSearchState()) {
    on<GetAllCategoriesEvent>((event, emit) async {
      emit(GetAllCategoriesLoadingState());
      try {
        List<Category> listCategories =
            await firebaseFireStoreRepository.getAllCategories();
        emit(GetAllCategoriesLoadedState(listCategories));
      } catch (e) {
        emit(GetAllCategoriesErrorState(e.toString()));
      }
    });
  }
}
