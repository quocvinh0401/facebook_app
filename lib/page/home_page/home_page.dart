import 'package:facebook_app/Widgets/post_card.dart';
import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:facebook_app/page/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({this.controllerTab, this.scrollController});

  ScrollController scrollController;
  TabController controllerTab;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: ListView(
        padding: EdgeInsets.zero,
        controller: widget.scrollController,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => widget.controllerTab
                                .animateTo(widget.controllerTab.index + 2),
                            child: Container(
                              height: 45.0,
                              width: 45.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(currentUser.imageUrl),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: OutlineButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              onPressed: () {},
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What\'s on your mind?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.5,
                  thickness: 1,
                ),
                Row(
                  children: [
                    ButtonBottom(
                        color: Colors.red, icon: Icons.camera, text: 'Live'),
                    Container(
                      height: 30.0,
                      child: VerticalDivider(
                        width: 2.0,
                        thickness: 1,
                      ),
                    ),
                    ButtonBottom(
                        color: Colors.green, icon: Icons.photo, text: 'Photos'),
                    Container(
                      height: 30.0,
                      child: VerticalDivider(
                        width: 2.0,
                        thickness: 1,
                      ),
                    ),
                    ButtonBottom(
                        color: Colors.purple,
                        icon: Icons.video_call,
                        text: 'Life Event')
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10.0),
            height: 70.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: onlineUsers.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 5.0, 12.0),
                    child: CreateRoomButton(),
                  );
                } else {
                  final User user = onlineUsers[index - 1];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                    child: ProfileAvatar(
                      user: user,
                    ),
                  );
                }
              },
            ),
          ),
          StoryCard(),
          ListView.builder(
            physics: ScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              final Post post = posts[index];
              return PostCard(post: post, name: post.user.name, ava: post.user.imageUrl,);
            },
          )
        ],
      ),
    );
  }
}


