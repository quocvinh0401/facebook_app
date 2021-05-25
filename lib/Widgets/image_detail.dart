import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  ImageDetail({this.post});

  Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Scaffold(
                      backgroundColor: Colors.black,
                      body: Center(
                          child: Hero(
                            tag: post.imageUrl,
                            child: Image.network(post.imageUrl, fit: BoxFit.fitWidth,),
                          ),
                      ),
                    )));
      },
      child: Hero(
        tag: post.imageUrl,
        child: Image.network(post.imageUrl),
      ),
    );
  }
}
