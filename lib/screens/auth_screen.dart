import 'package:bloggy/views/view_auth.dart';
import 'package:bloggy/views/view_validation.dart';
import 'package:bloggy/widgets/auth_module/log_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/constants/colors.dart';
import '../widgets/auth_module/sign_up.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ViewValidation>().logIn
          ? AppColors.backgroundPrimary
          : AppColors.backgroundAdditional,
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        child: context.watch<ViewValidation>().logIn
            ? const LogIn()
            : const SignUp(),
      ),
    );
  }
}
