import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_responsive_ui/data/data.dart';
import 'package:instagram_responsive_ui/models/models.dart';
import 'package:instagram_responsive_ui/screens/comments_screen.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool haveStory = true;
    for (Story story in stories) {
      if (story.user == post.user) {
        if (!story.isViewed) {
          haveStory = false;
        }
      }
    }
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(haveStory: haveStory, post: post),
            _cachedImage(),
            PostIcons(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.views.toString() + " views",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                  PostMakerCaption(post: post),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Text(
                        "View all ${post.commentsNbr} comments",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${post.date} ago",
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CommentsScreen(
        comments: post.comments,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Padding _cachedImage() {
    return Padding(
      padding: EdgeInsets.zero,
      child: CachedNetworkImage(imageUrl: post.imageUrl),
    );
  }
}

class PostMakerCaption extends StatelessWidget {
  const PostMakerCaption({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: post.user.name + " ",
                style: new TextStyle(fontWeight: FontWeight.bold)),
            new TextSpan(
              text: post.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class PostIcons extends StatelessWidget {
  const PostIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.black,
                size: 28,
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.comment,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.paperPlane,
                color: Colors.black,
                size: 28,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.bookmark,
            color: Colors.black,
            size: 28,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.haveStory,
    required this.post,
  }) : super(key: key);

  final bool haveStory;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Row(
            children: [
              StoryProfileAvatar(
                isAddStory: haveStory,
                post: true,
                urlImage: post.user.imageUrl,
                size: 28,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                post.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
