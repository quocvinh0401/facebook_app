import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class LoadingLogin extends StatefulWidget {

  final int numberPass;
  final int numberID;
  final String checkId;
  final String checkPass;
  const LoadingLogin({this.checkId, this.checkPass, this.numberID, this.numberPass});

  @override
  _LoadingLoginState createState() => _LoadingLoginState();
}

class _LoadingLoginState extends State<LoadingLogin> {

  String textDialog;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      if (widget.checkId == account.id && widget.checkPass == account.password) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
        if (widget.numberPass == 0 && widget.numberID == 0) {
          textDialog = 'password';
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Login Failed'),
                  content: Container(
                    height: 70,
                    child: Stack(
                      children: [
                        Text(
                          '[100] (#100) The parameter $textDialog is required',
                          style: TextStyle(fontSize: 15),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0,
                            height: 0,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else if (widget.numberPass == 0 && widget.numberID != 0) {
          textDialog = 'password';
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Login Failed'),
                  content: Container(
                    height: 70,
                    child: Stack(
                      children: [
                        Text(
                          '[100] (#100) The parameter $textDialog is required',
                          style: TextStyle(fontSize: 15),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0,
                            height: 0,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else  if (widget.numberPass != 0 && widget.numberID == 0){
          textDialog = 'email';
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Login Failed'),
                  content: Container(
                    height: 70,
                    child: Stack(
                      children: [
                        Text(
                          '[100] (#100) The parameter $textDialog is required',
                          style: TextStyle(fontSize: 15),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minWidth: 0,
                            height: 0,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          null;
        }
      }
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
                child: Text('Logging in', style: TextStyle(
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
