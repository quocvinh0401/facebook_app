import 'package:facebook_app/Widgets/post_card.dart';
import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.0),
            color: Colors.white,
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Ava_Background(),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 16.0),
                  child: Text(
                    currentUser.name,
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        color: Colors.blue[800],
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Add to Story',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.dotsHorizontal),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 18.0,
                  thickness: 1.0,
                ),
                Container(
                  child: Column(
                    children: [
                      Info_user(
                        icon: FontAwesome.graduation_cap,
                        normalText: 'Went to ',
                        boldText: 'THPT Chuyên Nguyễn Quang Diêu',
                      ),
                      Info_user(
                        icon: Icons.home,
                        normalText: 'Lives in ',
                        boldText: 'Cao Lãnh',
                      ),
                      Info_user(
                          icon: Icons.location_on,
                          normalText: 'From ',
                          boldText: 'Cao Lãnh'),
                      Info_user(
                        icon: MdiIcons.dotsHorizontal,
                        normalText: 'See Your About Info',
                        boldText: '',
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {},
                    color: Colors.blue[100],
                    child: Text(
                      'Edit Public Details',
                      style: TextStyle(color: Colors.blue[900], fontSize: 17.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          FriendTable(),
          PostStatus(),
          ListView.builder(
            physics: ScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              final Post post = posts[index];
              return post.user == currentUser ? PostCard(post: post, name: currentUser.name, ava: currentUser.imageUrl, ) : SizedBox.shrink();
            },
          )
        ],
      )
    );
  }
}


