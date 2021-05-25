import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class CommentContent extends StatelessWidget {

  const CommentContent({this.post});
  final Post post;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatarImage(user: post.user, width: 45, height: 45),
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius
                        .circular(16.0),
                    color: Colors.blueGrey[50]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text(post.user.name,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight
                                .bold)),
                    SizedBox(height: 4.0,),
                    Text(
                      'Nice to meet you',
                      style: TextStyle(
                          fontSize: 16.0),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.0, left: 10),
                child: Row(
                  children: [
                    Text('4h', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(width: 15,),
                    Text('Like', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                    SizedBox(width: 15,),
                    Text('Reply', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}