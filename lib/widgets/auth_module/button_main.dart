import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/data/constants/snack_bar_errors.dart';
import 'package:bloggy/data/routes/routes.dart';
import 'package:bloggy/views/view_auth.dart';
import 'package:bloggy/views/view_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.checkError})
      : super(key: key);

  final String text;
  final Function onPressed;
  final Function checkError;

  @override
  Widget build(BuildContext context) {
    final validationView = Provider.of<ViewValidation>(context);
    final authView = Provider.of<ViewAuth>(context);

    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.textPrimary,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: AppColors.textPrimary,
                  offset: Offset(2, 2),
                  blurRadius: 15,
                  spreadRadius: 1),
              BoxShadow(
                  color: AppColors.backgroundAdditional,
                  offset: Offset(-2, -2),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: AppColors.textPrimaryLight,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (checkError()) {
              await onPressed(validationView.loginController.text,
                      validationView.passwordController.text)
                  .then((_) {
                if (authView.snackBar == null) {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(authView.snackBar!);
                }
              });
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(AppSnackBarErrors.snackDefaultError);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: AppColors.textPrimaryLight, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
