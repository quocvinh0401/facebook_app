import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostCard extends StatefulWidget {
  PostCard({this.post, this.name, this.ava});

  String ava;
  String name;
  Post post;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool like = false;
  TextEditingController _commentController;
  int numberCharComment = 0;
  Icon iconComment = Icon(FontAwesome.smile_o);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.ava),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(widget.post.timeAgo + ' \u2022')
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ButtonTheme(
                      padding: EdgeInsets.all(3.0),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minWidth: 0,
                      height: 0,
                      child: FlatButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 480,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          Icons.push_pin_outlined,
                                          size: 30,
                                        ),
                                        title: Text('Pin post'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                            Icons.bookmark_border_outlined,
                                            size: 30),
                                        title: Text('Save post'),
                                        subtitle: Text(
                                            'Add this to your saved items'),
                                      ),
                                      ListTile(
                                        leading:
                                        Icon(Icons.edit_outlined, size: 30),
                                        title: Text('Edit post'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                            Icons.lock_outline_rounded,
                                            size: 30),
                                        title: Text('Edit privacy'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.push_pin_outlined,
                                            size: 30),
                                        title: Text('Move to archive'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.push_pin_outlined,
                                            size: 30),
                                        title: Text('Move to trash'),
                                        subtitle: Text(
                                            'Items in your trash are deleted after 30 days'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                            Icons.notifications_none_outlined,
                                            size: 30),
                                        title: Text(
                                            'Turn off notifications for this post'),
                                      ),
                                      ListTile(
                                        leading: Icon(MdiIcons.linkBoxOutline,
                                            size: 30),
                                        title: Text('Copy link'),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        shape: CircleBorder(),
                        child: Icon(Icons.more_horiz),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                widget.post.caption != null
                    ? Text(
                  widget.post.caption,
                  style: TextStyle(fontSize: 16.0),
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          widget.post.imageUrl != null
              ? ImageDetail(post: widget.post)
              : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            color: Colors.white,
            child: ButtonTheme(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minWidth: 0,
              height: 0,
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 8.0),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(widget.post.likes.toString(),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.post.comments.toString() +
                              ' Comments \u2022 ' +
                              widget.post.shares.toString() +
                              ' Shares',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Divider(
              thickness: 1,
              height: 0.1,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: FlatButton.icon(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        setState(() {
                          like = !like;
                          like
                              ? widget.post.likes = widget.post.likes + 1
                              : widget.post.likes = widget.post.likes - 1;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up_outlined,
                        color: like ? Colors.blue : Colors.black,
                      ),
                      label: Text('Like',
                          style: TextStyle(
                            color: like ? Colors.blue : Colors.black,
                          )))),
              Expanded(
                  child: FlatButton.icon(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(bottom: MediaQuery
                                    .of(context)
                                    .viewInsets
                                    .bottom + 6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0)),
                                  color: Colors.white,
                                ),
                                height: 733,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => print('comment tapped'),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 0.3,
                                                    color:
                                                    Colors.grey[400]))),
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.thumb_up,
                                                      color: Colors.blue,
                                                      size: 18,
                                                    ),
                                                    SizedBox(
                                                      width: 4.0,
                                                    ),
                                                    Text(
                                                        '${widget.post.likes}'),
                                                    SizedBox(
                                                      width: 4.0,
                                                    ),
                                                    Icon(Icons
                                                        .arrow_forward_ios_outlined),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  like = !like;
                                                  like
                                                      ? widget.post.likes =
                                                      widget.post.likes +
                                                          1
                                                      : widget.post.likes =
                                                      widget.post.likes -
                                                          1;
                                                });
                                              },
                                              child: Icon(
                                                Icons.thumb_up_outlined,
                                                color: like
                                                    ? Colors.blue
                                                    : Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        color: Colors.white,
                                        child: CommentContent(post: posts[1],)
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 12.0, top: 6.0),
                                      decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey[400],
                                                width: 0.7)
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          ButtonTheme(
                                            child: IconButton(
                                              // constraints: BoxConstraints(maxHeight: 0, maxWidth: 40),
                                              onPressed: () {},
                                              icon: Icon(
                                                Entypo.camera, size: 28,),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 12.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.blueGrey[50],
                                                  borderRadius: BorderRadius
                                                      .circular(30.0)
                                              ),
                                              height: 45,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 220,
                                                    child: TextField(
                                                      onChanged: (text) {
                                                        setState(() {
                                                          numberCharComment =
                                                              text.length;
                                                          numberCharComment == 0
                                                              ?
                                                          iconComment = Icon(
                                                            FontAwesome.smile_o,
                                                            size: 28,)
                                                              : iconComment =
                                                              Icon(Icons.send,
                                                                size: 28,
                                                                color: Colors
                                                                    .blue,);
                                                        });
                                                      },
                                                      decoration: InputDecoration(
                                                          hintText: 'Write a comment...',
                                                          hintStyle: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .grey[400]
                                                          ),
                                                          border: InputBorder
                                                              .none
                                                      ),
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    // constraints: BoxConstraints(maxHeight: 0, maxWidth: 40),
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Entypo.camera, size: 28,),
                                                  ),
                                                  IconButton(
                                                    // constraints: BoxConstraints(maxHeight: 0, maxWidth: 40),
                                                      onPressed: () {},
                                                      icon: iconComment
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(MdiIcons.commentOutline),
                      label: Text('Comment'))),
              Expanded(
                  child: FlatButton.icon(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      icon: Icon(MdiIcons.shareOutline),
                      label: Text('Share'))),
            ],
          )
        ],
      ),
    );
  }
}






