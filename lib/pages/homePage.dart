import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/pages/widgets/common_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:beta_balmer/pages/imageCardList.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  TabController _controller;
  TextEditingController _searchQuery = new TextEditingController();
  Icon actionIcon = new Icon(Icons.search, color: Colors.black,);
  Widget appBarTitle = new Text("");


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
      key: scaffoldKey,
        drawer: CommonDrawer(),
      appBar: new AppBar(
        leading: Image.asset(UIData.balmerLogo, scale: 0.3,),
        backgroundColor: Colors.white,
        bottom: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black.withOpacity(0.8),
          tabs: const <Tab>[
            const Tab(text: 'Populares'),
            const Tab(text: 'Para ti'),
            const Tab(text: 'Que hacer hoy'),
          ],
          indicatorColor: Colors.green,
        ),
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
    
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          ImageCardList(),
          ImageCardList(),
          ImageCardList(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
       currentIndex: 0, 
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Inicio'),
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
           icon: Icon(FontAwesomeIcons.plusCircle),
           title: Text('Crear')
         )
       ],
     ),
      ),
    );
  }
}
