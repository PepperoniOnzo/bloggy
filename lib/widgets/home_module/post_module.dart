import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/views/view_home.dart';
import 'package:bloggy/widgets/home_module/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostModule extends StatelessWidget {
  const PostModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ViewHome>().getHttpAllPosts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        Widget child;
        if (snapshot.connectionState == ConnectionState.done) {
          child = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.read<ViewHome>().getLenghtPost().toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold)),
              const Text(
                "TOTAL POSTS",
                style: TextStyle(
                    color: AppColors.backgroundBrown,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              TextButton(
                onPressed: () => {},
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add_circle_outline, size: 50),
                  ),
                ),
              ),
              const Divider(),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: context.watch<ViewHome>().errorMessage.isEmpty &&
                          context.watch<ViewHome>().getLenghtPost() > 0
                      ? ListView.builder(
                          itemCount: context.watch<ViewHome>().getLenghtPost(),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return PostCard(
                                index: index,
                                post: context
                                    .read<ViewHome>()
                                    .getPostByIndex(index));
                          }))
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            context.read<ViewHome>().errorMessage.isEmpty
                                ? "No posts yet"
                                : context.watch<ViewHome>().errorMessage,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        )),
            ],
          );
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
    );
  }
}
