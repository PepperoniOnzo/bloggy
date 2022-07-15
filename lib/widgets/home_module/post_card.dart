import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/models/post.dart';
import '../../data/routes/routes.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.index, required this.post})
      : super(key: key);
  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.post, arguments: index);
      },
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.08,
            minHeight: MediaQuery.of(context).size.height * 0.08,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      post.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(post.body,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: AppColors.backgroundBrown))
                  ],
                ),
              ),
              const Text(
                "ᚠ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
