import 'package:flutter/cupertino.dart';

import '../data/models/validation_items.dart';

class ViewValidation extends ChangeNotifier {
  bool logIn = true;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  ValidationContainer loginValidationItem = ValidationContainer("", null);
  ValidationContainer passwordValidationItem = ValidationContainer("", null);
  ValidationContainer passwordRepeatValidationItem =
      ValidationContainer("", null);

  bool checkSignUp() {
    return loginValidationItem.checkError() &&
        passwordValidationItem.checkError() &&
        passwordRepeatValidationItem.checkError();
  }

  bool checkLogIn() {
    return loginValidationItem.checkError() &&
        passwordValidationItem.checkError();
  }

  void changeLogin(String mes) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mes)) {
      loginValidationItem =
          ValidationContainer(mes, "Enter a valid email address");
    } else {
      loginValidationItem = ValidationContainer(mes, null);
    }
    notifyListeners();
  }

  void changePassword(String mes) {
    if (mes.length < 6) {
      passwordValidationItem =
          ValidationContainer(mes, "Password must be at least 6 characters");
    } else {
      passwordValidationItem = ValidationContainer(mes, null);
    }
    notifyListeners();
  }

  void changePasswordRepeat(String mes) {
    if (mes != passwordController.text) {
      passwordRepeatValidationItem =
          ValidationContainer(mes, "Passwords do not match");
    } else {
      passwordRepeatValidationItem = ValidationContainer(mes, null);
    }
    notifyListeners();
  }

  void changeState() {
    logIn = !logIn;

    loginController.clear();
    passwordController.clear();
    passwordRepeatController.clear();

    loginValidationItem = ValidationContainer("", null);
    passwordValidationItem = ValidationContainer("", null);
    passwordRepeatValidationItem = ValidationContainer("", null);

    notifyListeners();
  }
}
