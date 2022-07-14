import 'package:bloggy/data/constants/snack_bar_errors.dart';
import 'package:bloggy/data/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAuth extends ChangeNotifier {
  FirebaseService firebaseService = FirebaseService();
  SnackBar? snackBar;

  Future<void> signUp(String email, String password) async {
    try {
      await firebaseService.auth
          .createUserWithEmailAndPassword(email: email, password: password);
      snackBar = null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        snackBar = AppSnackBarErrors.snackEmailInUseError;
      } else if (e.code == 'network-request-failed') {
        snackBar = AppSnackBarErrors.snackInternetError;
      } else {
        snackBar = AppSnackBarErrors.snackUnknownError;
      }
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      await firebaseService.auth
          .signInWithEmailAndPassword(email: email, password: password);
      snackBar = null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBar = AppSnackBarErrors.snackUserNotFoundError;
      } else if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        snackBar = AppSnackBarErrors.snackWrongPassOrEmailError;
      } else if (e.code == 'network-request-failed') {
        snackBar = AppSnackBarErrors.snackInternetError;
      } else {
        snackBar = AppSnackBarErrors.snackUnknownError;
      }
    }
  }

  Future<User?> checkAuth() async {
    return firebaseService.auth.currentUser;
  }
}
