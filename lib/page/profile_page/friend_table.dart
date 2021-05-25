import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:flutter/material.dart';

class FriendTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 12.0),
      margin: EdgeInsets.only(top: 0.5),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Friends', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text('${onlineUsers.length} friends', style: TextStyle(
                      fontSize: 18.0
                    ),),
                  )
                ],
              ),
              ButtonTheme(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0.0,
                height: 0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                  onPressed: (){},
                  child: Text('Find Friends', style: TextStyle(color: Colors.blue[800],
                  fontSize: 18.0, fontWeight: FontWeight.w400),),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Friend(idx: 0,),
                    SizedBox(width: 7.0,),
                    Friend(idx: 1,),
                    SizedBox(width: 7.0,),
                    Friend(idx: 2,),
                  ],
                ),
                SizedBox(height: 6.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Friend(idx: 3,),
                    SizedBox(width: 7.0,),
                    Friend(idx: 4,),
                    SizedBox(width: 7.0,),
                    Friend(idx: 5,),
                  ],
                ),
                SizedBox(height: 10.0,),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: (){},
                    child: Text('See All Friends'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Friend extends StatelessWidget {

  const Friend({this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => print('pressed'),
              child: Container(
                margin: EdgeInsets.only(bottom: 8.0),
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(onlineUsers[idx].imageUrl),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 4.0),
              width: double.infinity,
              child: ButtonTheme(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minWidth: 0,
                height: 0,
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(1.0),
                  onPressed: (){},
                    child: Align(alignment: Alignment.topLeft,
                        child: Text(onlineUsers[idx].name, style: TextStyle(fontSize: 16.0),))),
              ),
            ),
          ],
        )
    );
  }
}