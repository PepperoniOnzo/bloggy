import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/views/view_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonChangeState extends StatelessWidget {
  const ButtonChangeState({Key? key, required this.textButton})
      : super(key: key);
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppColors.textPrimaryLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {
        context.read<ViewValidation>().changeState();
      },
      child: Text(
        textButton,
        style: const TextStyle(fontSize: 20, color: AppColors.textPrimaryLight),
      ),
    );
  }
}
