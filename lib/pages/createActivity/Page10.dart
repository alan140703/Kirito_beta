import 'package:beta_balmer/pages/widgets/common_drawer.dart';
import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Page10Act extends StatefulWidget {
  @override
  _Page10ActState createState() => _Page10ActState();
}

class _Page10ActState extends State<Page10Act> with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
 
  TabController _controller;
  TextEditingController _searchQuery = new TextEditingController();
  Icon actionIcon = new Icon(Icons.search, color: Colors.black,);
  Widget appBarTitle = new Text("");

 Widget bodyData(BuildContext context) => Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              new Text("Actividad Publicada", style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15.0),
              new Text("Aprende entre amigos", style:TextStyle(
                color: Colors.green, fontSize: 15,
              )),

            ],
          ),
        ),
      );
  @override
  void initState() {
    super.initState();
    _controller = new TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Image.asset(UIData.balmerLogo, scale: 0.3,),
        backgroundColor: Colors.white,
         actions: <Widget>[
          new IconButton(icon: actionIcon,onPressed:(){
          setState(() {
                     if ( this.actionIcon.icon == Icons.search){
                      this.actionIcon = new Icon(Icons.close, color: Colors.black,);
                      this.appBarTitle= TextField(
                          controller: _searchQuery,
                          decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search,color: Colors.black),
                          hintText: "Search...",
                          //hintStyle: new TextStyle(color: Colors.black)
                        ),
                      );}
                      else {
                        this.actionIcon = new Icon(Icons.search, color: Colors.black,);
                         _searchQuery.clear();
                      }


                    });
        } ,),
        new IconButton(
              icon: Icon(Icons.mail, color: Colors.black,),
              onPressed: () {},
            ),
        new IconButton(icon: new Icon(FontAwesomeIcons.ellipsisV, color: Colors.black.withOpacity(0.8),),
            onPressed: () => scaffoldKey.currentState.openDrawer()),
        
        ]
      ),
    
      body: bodyData(context),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
       currentIndex: 0, 
       items: [
         BottomNavigationBarItem(
           icon: new IconButton( 
             icon: new Icon(Icons.home),
             onPressed: (){
               Navigator.of(context).pushNamedAndRemoveUntil("/homePage", (Route <dynamic> route)=> false);
             },
           ),
            title: new Text('Inicio')
         ),
         BottomNavigationBarItem(
           icon: new Icon(FontAwesomeIcons.bars),
           title: new Text('Actividades'),
         ),
         BottomNavigationBarItem(
           icon: Icon(FontAwesomeIcons.heart),
           title: Text('Favoritos')
         ),
         BottomNavigationBarItem(
           icon: new IconButton(
             icon: Icon(FontAwesomeIcons.plusCircle),
             onPressed: (){
               Navigator.pushNamed(context, UIData.activityRoute1);
             },
           ),//Icon(FontAwesomeIcons.plusCircle),
           title: Text('Crear'),
         )
       ],
     ),
      ),
    );
  }
}