import 'package:bloggy/views/view_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/constants/colors.dart';
import '../../views/view_auth.dart';
import 'button_change_state.dart';
import 'button_main.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationView = Provider.of<ViewValidation>(context);
    final viewAuth = Provider.of<ViewAuth>(context);

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topRight,
                child: ButtonChangeState(
                  textButton: 'Log in',
                ),
              )),
          const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Sign up",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold)),
              )),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                TextField(
                  controller: validationView.loginController,
                  onChanged: (String mes) {
                    validationView.changeLogin(mes);
                  },
                  decoration: InputDecoration(
                    labelText: "Your email",
                    errorText: validationView.loginValidationItem.error,
                  ),
                ),
                TextField(
                  controller: validationView.passwordController,
                  obscureText: true,
                  onChanged: (String mes) {
                    validationView.changePassword(mes);
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText: validationView.passwordValidationItem.error,
                  ),
                ),
                TextField(
                  controller: validationView.passwordRepeatController,
                  obscureText: true,
                  onChanged: (String mes) {
                    validationView.changePasswordRepeat(mes);
                  },
                  decoration: InputDecoration(
                    labelText: "Repeat password",
                    errorText:
                        validationView.passwordRepeatValidationItem.error,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ButtonAuth(
                text: "Sign up",
                onPressed: viewAuth.signUp,
                checkError: validationView.checkSignUp,
              )),
          const Expanded(
            flex: 5,
            child: Text(''),
          )
        ],
      ),
    );
  }
}
