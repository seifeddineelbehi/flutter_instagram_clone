import 'package:meta/meta.dart';
import 'package:instagram_responsive_ui/models/models.dart';

class Post {
  final User user;
  final String imageUrl;
  final String likedBy;
  final String date;
  final String caption;
  final int commentsNbr;
  final int likesNbr;
  final int views;
  final List<Comment> comments;

  Post({
    required this.user,
    required this.imageUrl,
    required this.likedBy,
    required this.date,
    required this.caption,
    required this.commentsNbr,
    required this.likesNbr,
    required this.views,
    required this.comments,
  });
}
