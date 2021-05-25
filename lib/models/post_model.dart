import 'model.dart';
import 'package:meta/meta.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  int likes;
  final int comments;
  final int shares;
  final List<Comment> listComment;

  Post({
    @required this.user,
    @required this.caption,
    @required this.timeAgo,
    @required this.imageUrl,
    @required this.likes,
    @required this.comments,
    @required this.shares,
    @required this.listComment,
  });
}