import 'package:flutter/material.dart';
import 'package:beta_balmer/utils/uidata.dart';


class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "¿Donde te encuentras?",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.0),
            ),
            accountEmail: Text(
              "Guadalajara, Mèxico",
            ),

            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(UIData.balmerLogo),
            ),
          ),
          new ListTile (
            title: Text(
              "Imformaciòn de usuario",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.contact_mail,
              color:  Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Apreciacion",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.star_border,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Estadìsticas / Pagos",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
          ),
          new ListTile(
            title: Text(
              "Configuraciòn",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Ayuda",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
          ),
          Divider(),
          //MyAboutTile()
        ],
      ),
    );
  }
}
