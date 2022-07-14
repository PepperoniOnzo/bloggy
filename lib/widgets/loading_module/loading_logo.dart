import 'package:bloggy/data/constants/configurations.dart';
import 'package:flutter/material.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Text>[
          Text('#', style: TextStyle(fontSize: 100)),
          Text(AppConfig.appName,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
