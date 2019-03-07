import 'package:flutter/material.dart';
import 'package:beta_balmer/pages/viewActivity/calendarSelect.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> 
with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
      length: 2,
      vsync: this,
    );
  }



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
              //Navigator.pushNamed(context, UIData.activityRoute4);
            }),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Fechas Disponibles", style: TextStyle(color: Colors.green, fontSize: 13,),textAlign: TextAlign.start,),
         backgroundColor: Colors.white,
        bottom: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black.withOpacity(0.8),
          tabs: const <Tab>[
            const Tab(text: 'Opcion 1'),
            const Tab(text: 'Opcion 2'),
          ],
          indicatorColor: Colors.green,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          CalendarSelect(),
        ],
      ),
    );
  }
}