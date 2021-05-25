import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {

  const ListTileItem({this.text,this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print(text + ' tapped');
      },
      title: Text(text, style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w700
      ),),
      leading: Container(
        padding: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(icon, color: Colors.black,),
      ),
    );
  }
}
