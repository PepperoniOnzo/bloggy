import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({Key? key, required this.comment, required this.index})
      : super(key: key);
  final String comment;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.08,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary),
                ),
              ),
              Flexible(
                child: Text(comment,
                    style: const TextStyle(
                        color: AppColors.backgroundBrown, fontSize: 18)),
              ),
            ],
          ),
        ));
  }
}
