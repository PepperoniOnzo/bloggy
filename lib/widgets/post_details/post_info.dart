import 'package:bloggy/data/constants/colors.dart';
import 'package:bloggy/data/constants/snack_bar_errors.dart';
import 'package:bloggy/data/models/post.dart';
import 'package:bloggy/data/routes/routes.dart';
import 'package:bloggy/views/view_home.dart';
import 'package:bloggy/widgets/post_details/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostInfo extends StatefulWidget {
  const PostInfo({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<PostInfo> createState() => _PostInfoState();
}

class _PostInfoState extends State<PostInfo> {
  final TextEditingController _commentController = TextEditingController();

  @override
  dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<ViewHome>().refresh();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back, size: 25),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 'edit') {
                        Navigator.pushNamed(context, AppRoutes.edit);
                      } else if (value == 'delete') {
                        Navigator.pop(context);
                        context.read<ViewHome>().deletePost();
                        context.read<ViewHome>().refresh();
                      }
                    },
                    color: AppColors.backgroundPrimary,
                    icon: const Icon(Icons.more_vert, size: 25),
                    itemBuilder: (BuildContext context) {
                      return const [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              const Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(widget.post.title,
                    style: const TextStyle(
                      fontSize: 30,
                    )),
              ),
              const Divider(),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.post.body,
                      style: const TextStyle(fontSize: 18))),
              const Divider(),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: "Comment",
                  helperText: "Type your comment here",
                  suffix: IconButton(
                    icon: const Icon(Icons.send, color: AppColors.textPrimary),
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        context
                            .read<ViewHome>()
                            .sendComment(_commentController.text)
                            .then((value) {
                          if (value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Comment sent"),
                              duration: Duration(seconds: 1),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                AppSnackBarErrors.snackSmtWentWrongError);
                          }
                        });
                        setState(() {
                          _commentController.clear();
                        });
                      }

                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
              ),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: widget.post.comments?.isNotEmpty == true
                      ? ListView.builder(
                          itemCount: widget.post.comments?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return CommentCard(
                                index: index + 1,
                                comment: widget.post.comments![index].body);
                          }))
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "No comments yet",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
