import 'package:bloggy/data/constants/snack_bar_errors.dart';
import 'package:bloggy/data/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewAuth extends ChangeNotifier {
  FirebaseService firebaseService = FirebaseService();
  String currentUserEmail = '';
  SnackBar? snackBar;

  void signOut() {
    firebaseService.signOut();
    currentUserEmail = '';
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    try {
      await firebaseService.createUser(email: email, password: password);
      setEmail();
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
      await firebaseService.authenticateUser(email: email, password: password);
      setEmail();
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

  void setEmail() {
    User? user = firebaseService.currentUser;
    if (user != null) {
      currentUserEmail = user.email!;
    }
    notifyListeners();
  }

  Future<User?> checkAuth() async {
    setEmail();
    return firebaseService.currentUser;
  }
}
