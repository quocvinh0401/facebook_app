
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(user.imageUrl), fit: BoxFit.cover),
              shape: BoxShape.circle),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                shape: BoxShape.circle,
                color: Colors.green),
            height: 12.0,
            width: 12.0,
          ),
        )
      ],
    );
  }
}
