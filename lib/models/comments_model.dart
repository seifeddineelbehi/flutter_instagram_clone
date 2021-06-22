import 'package:meta/meta.dart';
import 'package:instagram_responsive_ui/models/models.dart';

class Comment {
  final User user;
  final String date;
  final String content;
  final int likesNbr;

  Comment({
    required this.user,
    required this.date,
    required this.likesNbr,
    required this.content,
  });
}
