import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../page.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: ListView(
          controller: scrollController,
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Icon_Button(onPress: () {}, icon: Icons.search)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                          child: Text(
                            'Earlier',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ...groups.map((e) => ListNotifications(group: e)).toList(),
                ],
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: groups.length,
                itemBuilder: (BuildContext context, int index) {
                  final Group group = groups[index];
                  return Container(
                    color: Colors.white,
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PageGroup()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatarImage(
                                user: group.post.user,
                                width: 70,
                                height: 70,
                              ),
                              Positioned(
                                right: 7,
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.blue),
                                  child: Icon(
                                    Icons.group,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: group.post.user.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: ' posted in ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                        children: [
                                          TextSpan(
                                            text: group.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text('Yesterday at 20:00')
                              ],
                            ),
                          ),
                          ButtonTheme(
                            padding: EdgeInsets.all(3),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0,
                            height: 0,
                            shape: CircleBorder(),
                            child: FlatButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context){
                                      return Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatarImage(user: group.post.user, height: 50, width: 50,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5, bottom: 16),
                                              child: Text('${group.post.user.name} posted in ${group.name}'),
                                            ),
                                            ListTileItem(
                                              icon: Icons.close,
                                              text: 'Remove this notification',
                                            ),
                                            ListTileItem(
                                              icon: Icons.close,
                                              text: 'Save lastest post',
                                            ),
                                            ListTileItem(
                                              icon: Icons.close,
                                              text: 'Only get notifications about friends\' posts from this group',
                                            ),
                                            ListTileItem(
                                              icon: Icons.close,
                                              text: 'Report issue to notifications team',
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              child: Icon(Icons.more_horiz),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
