import 'package:flutter/material.dart';

class AppSnackBarErrors {
  static const snackDefaultError =
      SnackBar(content: Text('Fill text fields properly'));

  static const snackInternetError =
      SnackBar(content: Text('Check internet connection'));

  static const snackUserNotFoundError =
      SnackBar(content: Text('User not found'));

  static const snackWrongPassOrEmailError =
      SnackBar(content: Text('Wrong password or email'));

  static const snackUnknownError =
      SnackBar(content: Text('Wrong password or email'));

  static const snackEmailInUseError =
      SnackBar(content: Text('Email is already in use'));
}
