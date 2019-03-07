import 'package:beta_balmer/pages/createActivity/Page9.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page8Act extends StatefulWidget {
  @override
  _Page8ActState createState() => _Page8ActState();
}

class _Page8ActState extends State<Page8Act> {
TextEditingController _controller = new TextEditingController();

Widget video() => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      new Text("Comparte un video (Opcional)"),
      new SizedBox(height: 15,),
      new TextField(
        controller: _controller,
        decoration: const InputDecoration(
                labelText: 'Introduce la url del video',
              ),
              keyboardType: TextInputType.url,

      )
    ],
  ),
);

  Widget titles() => Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            "Sube tus mejores fotografias",
            style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          new Text(
              "la fotografia principal es obligatoria y sera la primera que vean los participantes")
        ],
      ));

  Widget imageMain() => Container(
        child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              FlatButton.icon(icon: Icon(FontAwesomeIcons.camera,
                    size: 110.0, color: Colors.grey.withOpacity(0.5)),label: new Text(""), onPressed: (){ print("image");},
              )
              ],
            ),
          ),
        ),
       
      );

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
               Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page9Act(),
                    )
                  );
            }),
      );

  
  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
            titles(), 
            imageMain(),
            SizedBox(height: 70.0,),
            video(),
            SizedBox(height: 20,),
            continueButton()
            //gridImage(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Subir Fotos y Videos",
            style: TextStyle(
              color: Colors.green,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }
}
