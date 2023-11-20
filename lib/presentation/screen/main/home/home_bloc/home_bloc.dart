import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/product_discount.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_bloc/home_event.dart';
import 'package:ecommerce_app/presentation/screen/main/home/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;

  HomeBloc(this.firebaseFireStoreRepository) : super(HomeState()) {
    on<GetAllProducts>((event, emit) async {
      try {
        emit(AllProductsLoadingState());
        List<Product> listProductsNew =
        await firebaseFireStoreRepository.getAllProductsNew();
        List<Product> listProductsSale =
        await firebaseFireStoreRepository.getAllProductsSale();
        emit(AllProductsLoadedState(listProductsNew,listProductsSale));
      } catch (e) {
        emit(AllProductsErrorState(e.toString()));
      }
    });
  }


}
