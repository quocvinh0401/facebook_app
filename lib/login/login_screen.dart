import 'package:facebook_app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'loading_login.dart';

class Login extends StatefulWidget {
  final String checkId;
  final String checkPass;

  const Login({this.checkId, this.checkPass});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool obscureText = true;
  int numberPass = 0;
  int numberID = 0;
  IconData iconPass = MdiIcons.eyeOffOutline;
  String errorID = null;
  String errorPass = null;
  String checkId;
  String checkPass;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _idController.dispose();
    _passController.dispose();
  }

  void LoginButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoadingLogin(
              checkId: checkId,
              checkPass: checkPass,
              numberID: numberID,
              numberPass: numberPass,
            )));
  }

  Icon showIconPass() {
    return Icon(numberPass != 0 ? iconPass : null);
  }

  void changeIconPass() {
    obscureText = !obscureText;
    if (obscureText) {
      iconPass = MdiIcons.eyeOffOutline;
    } else {
      iconPass = MdiIcons.eyeOutline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              width: double.infinity,
              height: 220.0,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tiếng Việt',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w400),
                ),
                Text(
                  ' \u2022 ',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w400, fontSize: 18),
                ),
                Text(
                  'English',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w400),
                ),
                Text(
                  ' \u2022',
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w400, fontSize: 18),
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(3.0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  height: 0.0,
                  minWidth: 0.0,
                  child: FlatButton(
                    onPressed: () {
                      print('More clicked');
                    },
                    child: Text(
                      'More...',
                      style: TextStyle(
                          color: Colors.blue[800], fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0, top: 50),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          checkId = text;
                          numberID = text.length;

                        });
                      },
                      controller: _idController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Phone or email',
                          hintStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 18),
                          errorText: numberPass != 0 ? errorID : null),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            numberPass = text.length;
                            checkPass = text;
                          });
                        },
                        controller: _passController,
                        obscureText: obscureText,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 18),
                            errorText: numberPass != 0 ? errorPass : null),
                      ),
                      ButtonTheme(
                        padding: EdgeInsets.all(8.0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        height: 0.0,
                        minWidth: 0.0,
                        child: FlatButton(
                          shape: CircleBorder(),
                          onPressed: () {
                            setState(() {
                              changeIconPass();
                            });
                          },
                          child: showIconPass(),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 12.0),
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      color: Colors.blue[800],
                      onPressed: () {
                        LoginButton();
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.all(3.0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    height: 0.0,
                    minWidth: 0.0,
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPage()));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 120.0,
                        thickness: 1.5,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          'OR',
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        height: 120.0,
                        thickness: 1.5,
                      )),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    child: Text(
                      'Create New Facebook Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
