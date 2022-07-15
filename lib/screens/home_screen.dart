import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/widgets/home_module/home_info.dart';
import 'package:bloggy/widgets/home_module/post_module.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundPinky,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                    minHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  child: const HomeInfo()),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * 0.02,
              color: AppColors.backgroundBrown,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  decoration:
                      const BoxDecoration(color: AppColors.backgroundPrimary),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: PostModule(),
                  ),
                )),
            Divider(
              thickness: MediaQuery.of(context).size.height * 0.02,
              color: AppColors.backgroundAdditional,
            ),
          ]),
        ));
  }
}
