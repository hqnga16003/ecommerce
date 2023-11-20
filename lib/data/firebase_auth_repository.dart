import 'dart:core';

import 'package:ecommerce_app/app/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseAuthRepository {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthRepository(this.firebaseAuth);

  Future<void> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        throw ExceptionInvalidLoginCredentials();
      }
      if (e.code == "network-request-failed") {
        throw ExceptionNetworkRequestFailed();
      }
      if (e.code == "invalid-email") {
        throw ExceptionInvalidEmail();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseAuth.currentUser?.updateDisplayName(name);
      await sendEmailVerification();
      firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ExceptionPasswordWeak();
      }
      if (e.code == 'email-already-in-use') {
        throw ExceptionAccountAlreadyExists();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if(e.code == "invalid-email"){
        throw ExceptionInvalidEmail();
      }
      if (e.code == "network-request-failed") {
        throw ExceptionNetworkRequestFailed();
      }
    } catch (e) {
    }
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }
}
