import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/locator/locator.dart';
import '../../../data/firebase_auth_repository.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuthRepository firebaseAuthRepository =
      getIt<FirebaseAuthRepository>();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Rx<String> errorText = "".obs;

  Future<void> sendPasswordResetEmail(
      Function() navigation, Function(String error) showError) async {
    try {
      await firebaseAuthRepository.sendPasswordResetEmail(emailController.text);
      navigation();
    } catch (e) {
      errorText.value = "Not a valid email address. Should be your@email.com";
    }
  }

  String? emailValidator1(String value) {
    if (value.isEmpty) {
      errorText.value = "";
      return "Please enter Email";
    }
    return null;
  }
}
