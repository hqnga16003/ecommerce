
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../data/firebase_firestore_repository.dart';

abstract class FiltersProductEvent {}

class AddColorsEvent extends FiltersProductEvent {
  final String color;

  AddColorsEvent(this.color);
}

class RemoveColorEvent extends FiltersProductEvent {
  final String color;

  RemoveColorEvent(this.color);
}

class AddSizeEvent extends FiltersProductEvent {
  final String size;

  AddSizeEvent(this.size);
}

class RemoveSizeEvent extends FiltersProductEvent {
  final String size;

  RemoveSizeEvent(this.size);
}

class AddCategoryEvent extends FiltersProductEvent {
  final String category;

  AddCategoryEvent(this.category);
}

class RemoveCategoryEvent extends FiltersProductEvent {
  final String category;

  RemoveCategoryEvent(this.category);
}

class AddBrandEvent extends FiltersProductEvent {
  final String brand;

  AddBrandEvent(this.brand);
}

class RemoveBrandEvent extends FiltersProductEvent {
  final String brand;

  RemoveBrandEvent(this.brand);
}



class GetAllBrandEvent extends FiltersProductEvent {}


class SubmittedBrandEvent extends FiltersProductEvent {
}
class DiscardBrandEvent extends FiltersProductEvent {

}

class DiscardFiltersEvent extends FiltersProductEvent {

}

class InitFiltersEvent extends FiltersProductEvent {

}


//"=============================================================================="
class FiltersProductState {}

class SubmittedBrandState extends FiltersProductState {
 final String brands;
  SubmittedBrandState(this.brands);
}
class InitFiltersProductState extends FiltersProductState {

}
class DiscardState extends FiltersProductState {

}

@Singleton()
@injectable
class FiltersProductBloc
    extends Bloc<FiltersProductEvent, FiltersProductState> {
  final FirebaseFireStoreRepository firebaseFireStoreRepository;
  final List<String> colors = [];
  final List<String> sizes = [];
  final List<String> categories = [];
  final List<String> brands = [];

  List<String> listBrands = [];

  FiltersProductBloc(this.firebaseFireStoreRepository)
      : super(FiltersProductState()) {
    on<GetAllBrandEvent>((event, emit) async {
      try {
        listBrands = await firebaseFireStoreRepository.getAllBrands();
      } catch (e) {}
    });
    on<InitFiltersEvent>((event, emit) async {
      discard();
      emit(InitFiltersProductState());
    });
    on<AddColorsEvent>((event, emit) async {
      colors.add(event.color);
    });
    on<RemoveColorEvent>((event, emit) async {
      colors.remove(event.color);
    });

    on<AddSizeEvent>((event, emit) async {
      sizes.add(event.size);
    });
    on<RemoveSizeEvent>((event, emit) async {
      sizes.remove(event.size);
    });

    on<AddCategoryEvent>((event, emit) async {
      categories.add(event.category);
    });
    on<RemoveCategoryEvent>((event, emit) async {
      categories.remove(event.category);
    });

    on<AddBrandEvent>((event, emit) async {
      brands.add(event.brand);
    });
    on<RemoveBrandEvent>((event, emit) async {
      brands.remove(event.brand);
    });

    on<SubmittedBrandEvent>((event, emit) async {
      String stringBrands = brands.join(", ");
      emit(SubmittedBrandState(stringBrands));
    });
    on<DiscardBrandEvent>((event, emit) async {
      brands.clear();
      emit(SubmittedBrandState(""));
    });

    on<DiscardFiltersEvent>((event, emit) async {
      discard();
      emit(DiscardState());
    });
  }

  void discard(){
    colors.clear();
    sizes.clear();
    categories.clear();
    brands.clear();
  }
}
