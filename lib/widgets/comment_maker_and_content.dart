import 'package:flutter/material.dart';
import 'package:instagram_responsive_ui/models/models.dart';

class CommentMakerAndContent extends StatelessWidget {
  const CommentMakerAndContent({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: comment.user.name + " ",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                  text: comment.content,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
