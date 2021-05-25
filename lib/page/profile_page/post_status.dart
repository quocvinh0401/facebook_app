import 'package:facebook_app/data/data.dart';
import 'package:flutter/material.dart';

class PostStatus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Post', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),),
                Row(
                  children: [
                    ButtonTheme(
                      buttonColor: Colors.grey[300],
                      minWidth: 0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        elevation: 0,
                        onPressed: (){},
                        child: Icon(Icons.settings),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    ButtonTheme(
                      buttonColor: Colors.grey[300],
                      minWidth: 0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                        elevation: 0,
                        onPressed: (){},
                        child: Icon(Icons.settings),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: ButtonTheme(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: FlatButton(
                onPressed: (){},
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 12.0, 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(currentUser.imageUrl),
                                fit: BoxFit.cover
                            ),
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Text('What\'s on your mind?', style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16.0
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(height: 2.0, thickness: 1,),
          Row(
            children: [
              ButtonBottom(color: Colors.red, icon: Icons.camera, text: 'Live'),
              Container(
                height: 30.0,
                child: VerticalDivider(
                  width: 2.0,
                  thickness: 1,
                ),
              ),
              ButtonBottom(color: Colors.green, icon: Icons.photo, text: 'Photos'),
              Container(
                height: 30.0,
                child: VerticalDivider(
                  width: 2.0,
                  thickness: 1,
                ),
              ),
              ButtonBottom(color: Colors.blue, icon: Icons.bookmark, text: 'Life Event')
            ],
          )
        ],
      ),
    );
  }
}

class ButtonBottom extends StatelessWidget {

  ButtonBottom({this.icon, this.color, this.text});

  final IconData icon;
  final Color color;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        onPressed: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            SizedBox(width: 6.0,),
            Text(text, style: TextStyle(fontSize: 15.0),)
          ],
        ),
      ),
    );
  }
}