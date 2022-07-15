import 'package:bloggy/data/constants/configurations.dart';
import 'package:bloggy/data/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/constants/colors.dart';
import '../../views/view_auth.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppConfig.appName.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        const Divider(
          endIndent: 120,
          indent: 120,
          height: 2,
          color: AppColors.textPrimary,
        ),
        const Expanded(
          flex: 8,
          child: FittedBox(
              fit: BoxFit.contain,
              child: Align(
                child: Text(
                  AppConfig.appSubtitle,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Expanded(
          flex: 1,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Text>[
                const Text(
                  "CURRENT USER",
                  style: TextStyle(
                      color: AppColors.backgroundBrown,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  context.read<ViewAuth>().currentUserEmail,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                context.read<ViewAuth>().signOut();
                Navigator.pushReplacementNamed(context, AppRoutes.auth);
              },
              child: const Center(
                child: Icon(Icons.logout, size: 35),
              ),
            )
          ]),
        )
      ],
    );
  }
}
