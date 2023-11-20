import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/firebase_auth_repository.dart';

abstract class LoginEvent {}

class LoginWithUserNameAndPassword extends LoginEvent {
  final String userName, password;

  LoginWithUserNameAndPassword(this.userName, this.password);
}

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  String error;
  LoginFailure({required this.error});
}

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthRepository firebaseAuthRepository;

  LoginBloc(this.firebaseAuthRepository) : super(LoginInitial()) {
    on<LoginWithUserNameAndPassword>((event, emit) async {
      try {
        emit(LoginLoading());
        await firebaseAuthRepository.signIn(
            event.userName.trim(), event.password.trim());
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }


}
