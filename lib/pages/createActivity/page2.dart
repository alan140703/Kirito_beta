import 'package:flutter/material.dart';
import 'package:beta_balmer/logic/activities_bloc.dart';
import 'package:beta_balmer/model/activities.dart';
import 'package:beta_balmer/utils/uidata.dart';

class Page2Act extends StatefulWidget {
  @override
  _Page2ActState createState() => _Page2ActState();
}

class _Page2ActState extends State<Page2Act> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _editController = new TextEditingController();
  TextEditingController _descController2 = new TextEditingController();
  TextEditingController _descController3 = new TextEditingController();
  List _idiomas = ["Español", "Ingles", "Frances", "Aleman", "Japones"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentLang;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentLang = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String idioma in _idiomas) {
      items.add(new DropdownMenuItem(
          value: idioma,
          child: new Text(
            idioma,
            style: TextStyle(
                fontSize: 20, color: Colors.green, fontStyle: FontStyle.italic),
          )));
    }
    return items;
  }

  Widget title() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new TextFormField(
          decoration: const InputDecoration(
              labelText: 'Titulo *',
              hintText: "Escribe el nombre de la actividad"),
          keyboardType: TextInputType.text,
          autovalidate: true,
          controller: _titleController,
        ),
      );
  Widget description() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new TextField(
          controller: _editController,
          decoration: const InputDecoration(
              labelText: 'Descripción *',
              hintText: "Escribe brevemente de que trata tu actividad"),
          keyboardType: TextInputType.multiline,
          maxLines: 10,
        ),
      );
  Widget description2() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new TextField(
          controller: _descController2,
          decoration: const InputDecoration(
              labelText: '¿Quien puede participar?',
              hintText: "informa para quien es apto la actividad"),
          keyboardType: TextInputType.multiline,
          maxLines: 10,
        ),
      );
  Widget description3() => Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: new TextField(
          controller: _descController3,
          decoration: const InputDecoration(
              labelText: '¿Que aprendera el Participante?',
              hintText: "Informa un dato extra sobre la actividad"),
          keyboardType: TextInputType.multiline,
          maxLines: 10,
        ),
      );

  Widget languagePicker() => Container(
        // padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new DropdownButton(
              hint: new Text("Selecciona un idioma"),
              value: _currentLang,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
            new FlatButton(
              child: new Text(
                "+ Agrega idioma",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.white,
              textColor: Colors.green,
              onPressed: () {
                print("EL IDIOMA ES $_currentLang");
                print("Despliga un modal para agregar idioma");
              },
            ),
          ],
        ),
      );

  Widget userprofile() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              "¿Quien Organiza la Actividad",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            new Padding(
              padding: EdgeInsets.all(16.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",),
              ),
              Text("Carlos Flores",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
            ]),
          ],
        ),
      );

  Widget continueButton() => Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
            colors: [
            const Color(0xFF00827D),
            Colors.yellow
            ],
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
              Navigator.pushNamed(context, UIData.activityRoute3);
            }),
      );

  Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              title(),
              SizedBox(height: 16.0),
              description(),
              SizedBox(height: 16.0),
              new Text(
                "Idioma",
                style: new TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 30.0),
              languagePicker(),
              SizedBox(height: 16.0),
              description2(),
              SizedBox(height: 16.0),
              description3(),
              SizedBox(height: 16.0),
              userprofile(),
              SizedBox(height: 50.0),
              continueButton(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Datos Generales",
            style: TextStyle(
              color: Colors.green,
            )),
        backgroundColor: Colors.white70,
      ),
      body: bodyData(context),
    );
  }

  void changedDropDownItem(String selectedLang) {
    setState(() {
      _currentLang = selectedLang;
    });
  }
}
