import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/views/view_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundPinky,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Something went wrong',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  context.read<ViewHome>().refresh();
                  Navigator.pop(context);
                },
                child: const Text('Go home', style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    ));
  }
}
