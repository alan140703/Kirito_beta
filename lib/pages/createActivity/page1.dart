import 'package:flutter/material.dart';
import 'package:beta_balmer/pages/widgets/common_scaffold.dart';
import 'package:beta_balmer/utils/uidata.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  List _act = ["Curso", "Actividad Recreativa", "Entrenamiento"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentAct;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentAct = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String activity in _act) {
      items.add(new DropdownMenuItem(
          value: activity,
          child: new Text(
            activity,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
          )));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00827D),
                  const Color(0xFF46A040),
                  const Color(0xFF2E7DE1),
                  const Color(0xFF94348C)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BackButton(
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Selecciona el Tipo de Actividad ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new Theme(
                data:
                    Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: new DropdownButton(
                  value: _currentAct,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new FlatButton(
                child: new Text(
                  "Siguiente",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Colors.white,
                textColor: Colors.green,
                onPressed: () {
                  print("Selecciona $_currentAct");
                  Navigator.pushNamed(context, UIData.activityRoute2);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedAct) {
    setState(() {
      _currentAct = selectedAct;
    });
  }
}
