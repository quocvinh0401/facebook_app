import 'package:facebook_app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (contex) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25.0),
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'))),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'FACEBOOK',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0),
                    ),
                    Row(
                      children: [
                        IconUnderText(MdiIcons.facebook),
                        IconUnderText(MdiIcons.facebookMessenger),
                        IconUnderText(MdiIcons.instagram),
                        IconUnderText(MdiIcons.whatsapp),
                        IconUnderText(BrandIcons.oculus),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IconUnderText extends StatelessWidget {
  IconUnderText(this._icon);

  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 3.0),
      child: Icon(
        _icon,
        size: 23.0,
        color: Colors.grey[600],
      ),
    );
  }
}

