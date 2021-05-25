import 'package:facebook_app/home/home.dart';
import 'package:flutter/material.dart';


class Icon_Button extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  double size = 24.0;

  Icon_Button({this.icon, this.onPress, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ButtonTheme(
        padding: EdgeInsets.all(8.0),
        shape: CircleBorder(),
        buttonColor: Colors.grey[200],
        height: 0,
        minWidth: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: RaisedButton(
          elevation: 0.0,
          onPressed: onPress,
          child: Icon(
            icon,
            size: size,
          ),
        ),
      ),
    );
  }
}
