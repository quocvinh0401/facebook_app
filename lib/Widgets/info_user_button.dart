import 'package:flutter/material.dart';

class Info_user extends StatelessWidget {

  const Info_user({this.icon, this.normalText, this.boldText});

  final IconData icon;
  final String normalText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('tapped'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Icon(
                icon,
                color: Colors.grey[600],
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                    text: normalText,
                    style: TextStyle(
                        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: boldText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}