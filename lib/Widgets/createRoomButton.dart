import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect){
              return LinearGradient(
                begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Colors.purple,
                Colors.pink[200],
              ]).createShader(rect);
            },
            child: Icon(
              Icons.video_call,
              color: Colors.purple,
              size: 30.0,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'Create\nRoom',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
      borderSide: BorderSide(width: 2, color: Colors.blue[200]),
    );
  }
}
