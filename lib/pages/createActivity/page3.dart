import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';

class Page3Act extends StatefulWidget {
  @override
  _Page3ActState createState() => _Page3ActState();
}

class _Page3ActState extends State<Page3Act> {
  Widget continueButton() => Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFF00827D), Colors.yellow],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: new FlatButton(
            child: new Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              print('Clicked');
              Navigator.pushNamed(context, UIData.activityRoute4);
            }),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Text(
                "Indica el número máximo de participantes ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border(
                     top: BorderSide(width: 1.0, color: Colors.grey),
                  ),
                ),
                child: Center(
                  child: VerificationCodeInput(
                    length: 2,
                    keyboardType: TextInputType.number,
                    onCompleted: (String value) {
                      print(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              continueButton(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Número de participantes",
            style: TextStyle(
              color: Colors.green,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}
