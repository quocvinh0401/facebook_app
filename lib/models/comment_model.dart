import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'model.dart';

class Comment {
  final User user;
  final String commentText;

  const Comment({@required this.user, @required this.commentText });
}