import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_event.dart';
import 'package:ecommerce_app/presentation/screen/main/shop/bloc/shop_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/firebase_firestore_repository.dart';
import '../../../../model/product_cart.dart';

class CartEvent {}

class GetCart extends CartEvent {}

class IncrementProductEvent extends CartEvent {
  final ProductCart productCart;

  IncrementProductEvent(this.productCart);
}

class DecrementProductEvent extends CartEvent {
  final ProductCart productCart;

  DecrementProductEvent(this.productCart);
}

class AddToCartEvent extends CartEvent {
  final Product product;
  final String size;
  final String color;

  AddToCartEvent(this.product, this.size, this.color);
}

class RemoveProduct extends CartEvent {
  final ProductCart productCart;

  RemoveProduct(this.productCart);
}

abstract class CartState {
  bool get isSteady;
  bool get isTransient => !isSteady;
}

class CartLoadingState extends CartState {
  @override
  bool get isSteady => true;
}

class CartLoadedState extends CartState {
  final List<ProductCart> list;
  @override
  bool get isSteady => true;
  CartLoadedState(this.list);
}

class CartErrorState extends CartState {
  final String err;
  @override
  bool get isSteady => true;
  CartErrorState(this.err);
}


class IncrementProductState extends CartState {
  @override
  bool get isSteady => false;

}
@Singleton()
@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  List<ProductCart> listProductCart = [];


  CartBloc(this.firebaseFireStoreRepository) : super(CartLoadingState()) {
    on<AddToCartEvent>((event, emit) async {
      emit(CartLoadingState());
      await firebaseFireStoreRepository.addToCart(
          event.product, event.size, event.color);
      await Future.delayed(const Duration(milliseconds: 500));
      listProductCart =
      await firebaseFireStoreRepository.getProductsCart();
      emit(CartLoadedState(listProductCart));
    });

    on<GetCart>((event, emit) async {
      emit(CartLoadingState());
      try {
        listProductCart =
        await firebaseFireStoreRepository.getProductsCart();

            emit(CartLoadedState(listProductCart));

      } catch (e) {
      emit(CartErrorState(e.toString()));
      }
    });

    on<IncrementProductEvent>((event, emit) async {

      firebaseFireStoreRepository.incrementProductCart(event.productCart);
    });

    on<DecrementProductEvent>((event, emit) async {
      firebaseFireStoreRepository.decrementProductCart(event.productCart);
    });

    on<RemoveProduct>((event, emit) async {
      listProductCart.remove(event.productCart);
      firebaseFireStoreRepository.removeProductCart(event.productCart);
      emit(CartLoadedState(listProductCart));
    });
  }

  double getTotalPrice() {
    return listProductCart.fold(0, (previousValue, element) => previousValue +
        (element.quantity * element.product.priceProduct));
  }
}
