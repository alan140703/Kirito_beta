import 'package:flutter/material.dart';
import 'package:beta_balmer/pages/widgets/SimpleRoundButton.dart';

class Page2Act extends StatefulWidget {
  @override
  _Page2ActState createState() => _Page2ActState();
}

class _Page2ActState extends State<Page2Act> {


  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              
              SimpleRoundButton(
                backgroundColor: Colors.green,
                buttonText: new Text("Continuar", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Datos Generales", style: TextStyle(color: Colors.green,)),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}