import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/app/exception.dart';
import 'package:ecommerce_app/data/firebase_auth_repository.dart';
import 'package:either_dart/either.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../app/locator/locator.dart';


class SignUpController extends GetxController {
  final FirebaseAuthRepository firebaseAuthRepository = getIt<FirebaseAuthRepository>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FocusNode textFocusNodeName = FocusNode();
  FocusNode textFocusNodeEmail = FocusNode();
  FocusNode textFocusNodePassword = FocusNode();
  FocusNode textFocusNodeAttendee = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    textFocusNodeName.dispose();
    textFocusNodeEmail.dispose();
    textFocusNodePassword.dispose();
    textFocusNodeAttendee.dispose();
    super.dispose();
  }



  Future<void> signUp(Function() navigation ,Function(String error) showError) async {
    try {
      await firebaseAuthRepository.signUp(
          emailController.text, passwordController.text, nameController.text);
      navigation();
    } catch (e) {
      showError(e.toString());
    }
  }

  String? nameValidator(String value) {
    if (value.isEmpty) {
      return "Please enter User Name";
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return "Please enter Email";
    }
    if (!EmailValidator.validate(value)) {
      return "Email Invalid";
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return "Please enter Password";
    }
    if (value.length < 6) {
      return "Password must be greater than 6 characters";
    }
    return null;
  }

  @override
  void onClose() {

  }
}
