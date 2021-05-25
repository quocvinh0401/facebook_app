import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class CircleAvatarImage extends StatelessWidget {
  CircleAvatarImage({@required this.user, this.width, this.height});

  final User user;
  double width = 45;
  double height = 45;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(user.imageUrl), fit: BoxFit.cover),
          shape: BoxShape.circle),
    );
  }
}
