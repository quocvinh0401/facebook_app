import 'package:flutter/material.dart';

class PageGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Group'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text('Page '),),
      ),
    );
  }
}
