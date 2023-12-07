import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';
import '../../../../../model/address.dart';
import '../../../../../model/product_cart.dart';

class CheckoutState {}

class CheckOutSuccess extends CheckoutState {

}

class CheckoutEvent {}

class SubmitOrderEvent extends CheckoutEvent {
  final int totalPrice;
  final List<ProductCart> listProductCart;
  final AddressUser addressUser;

  SubmitOrderEvent(this.totalPrice, this.listProductCart, this.addressUser);
}

@Singleton()
@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;

  CheckoutBloc(this.firebaseFireStoreRepository) : super(CheckoutState()) {
    on<SubmitOrderEvent>((event, emit) async {
      firebaseFireStoreRepository.submitOrder(
          event.listProductCart, event.totalPrice,event.addressUser);
      firebaseFireStoreRepository.clearCart();
      emit(CheckOutSuccess());
    });
  }
}
