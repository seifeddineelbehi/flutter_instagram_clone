import 'package:flutter/material.dart';
import 'package:instagram_responsive_ui/data/data.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class WriteCommentContainer extends StatelessWidget {
  const WriteCommentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Row(
          children: [
            StoryProfileAvatar(
              size: 23,
              urlImage: currentUser.imageUrl,
              isAddStory: true,
              post: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black38),
                      hintText: 'Add a comment...',
                      border: InputBorder.none),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Post",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[200],
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
