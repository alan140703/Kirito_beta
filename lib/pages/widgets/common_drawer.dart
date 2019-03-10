import 'package:flutter/material.dart';
import 'package:beta_balmer/utils/uidata.dart';


class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
               child: UserAccountsDrawerHeader(
                 decoration: BoxDecoration(
                   color: Colors.lightBlue,
                 ),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Colors.transparent,
                   backgroundImage: new AssetImage(UIData.balmerLogo),
                  
                 ),
                  accountName: Text(
                    "¿Donde te encuentras?",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0, color: Colors.black),
                  ),
                  accountEmail: Text(
                    "Guadalajara, Mèxico",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          
         //HAcer botones completos
            Row(
          children: <Widget>[
            Expanded(
            child:new ListTile (
              title: Text(
            "Imformaciòn de usuario",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
                leading: IconButton(
                  icon: Icon(Icons.contact_mail),
                  color: Colors.black,
                  onPressed: (){
                    Navigator.pushNamed(context, UIData.activityRoute1);
                  },
                ),
            ),
            )
           ],
          ),
          Row(
          children: <Widget>[
            Expanded(
           child:
            new ListTile(

              leading: IconButton(
                icon: Icon(Icons.star_border),
                color: Colors.black,
                onPressed: (){
                  Navigator.pushNamed(context, UIData.activityRoute1);
                },
              ),
            title: Text(
            "Apreciacion",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            ),
            ),
          ]
          ),
          Row(
            children: <Widget>[
              Expanded(
                child:
                new ListTile(
                  title: Text(
                    "Estadìsticas / Pagos",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.credit_card),
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, UIData.activityRoute1);
                    },
                  ),
                ),
              )
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child:
                new ListTile(
                  title: Text(
                    "Configuraciòn",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, UIData.activityRoute1);
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child:
                new ListTile(
                  title: Text(
                    "Ayuda",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.help_outline),
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pushNamed(context, UIData.activityRoute1);
                    },
                  ),
                ),
              )
            ],
          ),
          //MyAboutTile()
        ],
      ),
    );
  }
}
