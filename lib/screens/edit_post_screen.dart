import 'package:bloggy/views/view_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/constants/snack_bar_errors.dart';
import '../data/models/post.dart';

class EditPostScreen extends StatefulWidget {
  const EditPostScreen({Key? key}) : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Post post = context.watch<ViewHome>().getSelectedPost();
    titleController.text = post.title;
    bodyController.text = post.body;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                TextButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        bodyController.text.isNotEmpty) {
                      Navigator.pop(context);

                      context
                          .read<ViewHome>()
                          .updatePost(titleController.text, bodyController.text)
                          .then((value) {
                        if (value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Post successfully edited"),
                            duration: Duration(seconds: 1),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              AppSnackBarErrors.snackSmtWentWrongError);
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          AppSnackBarErrors.snackFillAllFieldsError);
                    }

                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.send, size: 25),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: "Text",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
