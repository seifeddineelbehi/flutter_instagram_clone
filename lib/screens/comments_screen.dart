import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_responsive_ui/models/models.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class CommentsScreen extends StatelessWidget {
  final List<Comment> comments;
  const CommentsScreen({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final Comment comment = comments[index];
                    return CommentContainer(
                      comment: comment,
                    );
                  }, childCount: comments.length),
                ),
              ],
            ),
          ),
          WriteCommentContainer()
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Text(
        "Comments",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.paperPlane,
              color: Colors.black,
              size: 28,
            ))
      ],
    );
  }
}
