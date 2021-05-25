import 'package:flutter/material.dart';

class ChildrenExpansionTileCard extends StatelessWidget {
  const ChildrenExpansionTileCard({@required this.widget, @required this.title});
  final Widget widget;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(color: Colors.white,elevation: 4,
        child: ListTile(
          leading: widget,
          title: Text('Help Center'),
        ),
      ),
    );
  }
}