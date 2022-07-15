import 'package:bloggy/widgets/home_module/error.dart';
import 'package:bloggy/widgets/home_module/home_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/constants/colors.dart';
import '../views/view_home.dart';
import '../widgets/post_details/post_info.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int index = ModalRoute.of(context)!.settings.arguments as int;

    return WillPopScope(
      onWillPop: () async {
        
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: FutureBuilder(
          future: context.read<ViewHome>().getHttpPostWithComments(index),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Widget child;
            if (snapshot.connectionState == ConnectionState.done) {
              child = context.read<ViewHome>().errorPost.isEmpty
                  ? PostInfo(
                      post: context.read<ViewHome>().getSelectedPost(),
                    )
                  : const Error();
            } else {
              child = const Center(
                child: CircularProgressIndicator(
                  color: AppColors.textPrimary,
                ),
              );
            }
            return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500), child: child);
          },
        ),
      ),
    );
  }
}
