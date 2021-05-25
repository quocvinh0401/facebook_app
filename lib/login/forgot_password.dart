import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String text = 'Email';
  String hint = 'Email';
  String searchText = 'phone';
  int number = 0;
  final _controller = TextEditingController();
  TextInputType keyboardType = TextInputType.emailAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title:
              Text('Find Your Account', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0,12.0),
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Enter Your $text',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Stack(alignment: Alignment.centerRight, children: [
                      TextField(
                        keyboardType: keyboardType,
                        controller: _controller,
                        onChanged: (text){
                          setState(() {
                            number = text.length;
                          });
                        },
                        style: TextStyle(fontSize: 18.0),
                        decoration: InputDecoration(
                            hintText: hint,
                            hintStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 16.0)),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('tapped');
                          setState(() {
                            _controller.clear();
                            number = 0;
                          });
                        },
                        child: Icon(
                          number == 0 ? null : Icons.close,
                          color: Colors.grey[600],
                        ),
                      )
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {},
                        color: Colors.blue[900],
                        child: Text('Find Your Account', style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: ButtonTheme(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  height: 0,
                  minWidth: 0,
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        if (text == 'Email') {
                          text = 'Phone Number';
                          hint = 'Phone';
                          searchText = 'email';
                          keyboardType = TextInputType.number;
                        } else {
                          text = 'Email';
                          hint = 'Email';
                          searchText = 'phone';
                          keyboardType = TextInputType.emailAddress;
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Text('Search by your $searchText instead', style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[900]
                    ),),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
