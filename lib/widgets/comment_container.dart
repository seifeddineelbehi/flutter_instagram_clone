import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_responsive_ui/data/data.dart';
import 'package:instagram_responsive_ui/models/models.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class CommentContainer extends StatelessWidget {
  final Comment comment;
  const CommentContainer({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool haveStory = true;
    for (Story story in stories) {
      if (story.user == comment.user) {
        if (!story.isViewed) {
          haveStory = false;
        }
      }
    }
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoryProfileAvatar(
                    post: true,
                    isAddStory: haveStory,
                    urlImage: comment.user.imageUrl,
                    size: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommentMakerAndContent(comment: comment),
                        CommentData(comment: comment)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
