
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {

  const PostContainer({this.post});

  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      height: 50,
    );
  }
}
