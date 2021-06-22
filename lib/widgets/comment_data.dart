import 'package:flutter/material.dart';
import 'package:instagram_responsive_ui/models/models.dart';

class CommentData extends StatelessWidget {
  const CommentData({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            comment.date,
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            comment.likesNbr.toString() + " likes",
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Reply",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}