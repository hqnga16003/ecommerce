import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/locator/locator.dart';
import '../../../data/firebase_auth_repository.dart';

class LoginController extends GetxController{
  final FirebaseAuthRepository firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FocusNode textFocusNodeEmail = FocusNode();
  FocusNode textFocusNodePassword = FocusNode();



  Future<void> logIn(Function() navigation ,Function(String error) showError) async {
    try {
      await firebaseAuthRepository.signIn(
          emailController.text, passwordController.text);
      navigation();
    }
    catch (e) {
      showError(e.toString());
    }
  }


  String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Please enter Email";
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "Please enter Password";
    }
    return null;
  }

}