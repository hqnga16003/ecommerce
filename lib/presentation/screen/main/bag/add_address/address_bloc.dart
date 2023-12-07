import 'package:ecommerce_app/model/address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/firebase_firestore_repository.dart';

class AddressState {}

class AddressLoadedState extends AddressState {}

class AddressEvent {}

class GetAddressUser extends AddressEvent {}
class ChangeAddressDefault extends AddressEvent {}


class AddAddressEvent extends AddressEvent {
  final String name, address, city, state, zipCode, country;

  AddAddressEvent(
    this.name,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
  );
}

@Singleton()
@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  List<AddressUser> listAddressUser = [];

  AddressBloc(this.firebaseFireStoreRepository) : super(AddressState()) {
    on<GetAddressUser>((event, emit) async {
      listAddressUser = await firebaseFireStoreRepository.getAddressesUser();
      listAddressUser.sort((a, b) => b.createOn.compareTo(a.createOn));
    });
    on<ChangeAddressDefault>((event, emit) async {

    });
    on<AddAddressEvent>((event, emit) async {
      // AddressUser addressUser = AddressUser(
      //     event.name,
      //     event.address,
      //     event.city,
      //     event.state,
      //     event.zipCode,
      //     event.country,
      //     FirebaseAuth.instance.currentUser!.uid,
      //     true);
      AddressUser addressUser = AddressUser(
          "Hoang Quang Nga",
          "42/2 Luong Ngoc Quyen",
          "Ho Chi Minh",
          "Go Vap",
          "000000",
          "Viet Nam",
          FirebaseAuth.instance.currentUser!.uid,
          true,
          DateTime.now(),"");
      AddressUser addressDefault = getAddressUserDefault();
      firebaseFireStoreRepository.addAddressUser(addressUser);
      firebaseFireStoreRepository.changeAddressDefault(addressDefault.idAddress);
      changeAddressDefault(addressDefault);
      listAddressUser.insert(0,addressUser);
      emit(AddressLoadedState());
    });
  }

  AddressUser getAddressUserDefault() {
    late AddressUser addressUser;
    for (var element in listAddressUser) {
      if (element.isChoose) {
        addressUser = element;
        break;
      }
    }

    return addressUser;
  }


  void changeAddressDefault(AddressUser addressUser){
    addressUser.isChoose = false;
  }


}
