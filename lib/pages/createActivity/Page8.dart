import 'package:flutter/material.dart';

class Page8Act extends StatefulWidget {
  @override
  _Page8ActState createState() => _Page8ActState();
}

class _Page8ActState extends State<Page8Act> {
  

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              
            
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Subir Fotos y Videos", style: TextStyle(color: Colors.green,)),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}