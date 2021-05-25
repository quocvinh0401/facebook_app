import 'package:facebook_app/login/login.dart';
import 'package:flutter/material.dart';

class LoadingLogout extends StatefulWidget {
  @override
  _LoadingLogoutState createState() => _LoadingLogoutState();
}

class _LoadingLogoutState extends State<LoadingLogout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Logging out', style: TextStyle(
                    fontSize: 18.0
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
