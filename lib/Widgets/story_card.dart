import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      height: 240.0,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                height: 20,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey[400])),
                child: Stack(
                  children: [
                    Container(
                      height: 146.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(currentUser.imageUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0)),
                      ),
                    ),
                    Positioned(
                      top: 124,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[100], width: 0.1),
                            shape: BoxShape.circle,
                            color: Colors.grey[100]),
                        child: Icon(
                          Icons.add_circle,
                          size: 44,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 8.0,
                        left: 25,
                        child: Container(child: Text('Create Story')))
                  ],
                ),
              );
            } else {
              final Story story = stories[index - 1];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                width: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(story.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.srgbToLinearGamma()
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(story.user.imageUrl),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      left: 10,
                      right: 10.0,
                      child: Text(story.user.name,
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
