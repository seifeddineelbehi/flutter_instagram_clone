import 'package:flutter/material.dart';
import 'package:instagram_responsive_ui/models/models.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({Key? key, required this.stories, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryProfileAvatar(
                size: 40,
                isAddStory: true,
                urlImage: currentUser.imageUrl,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: StoryProfileAvatar(
              size: 40,
              urlImage: story.user.imageUrl,
            ),
          );
        },
      ),
    );
  }
}
