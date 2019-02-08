import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields(context)],
        ),
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            "assets/images/LOGO-06.png",
            height: 200,
            width: 200,
            //fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Bienvenido a ${UIData.appName}",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Ingresa para continuar",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields(context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Ingresa tu nombre de Usuario",
                  labelText: "Nombre de Usuario",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Ingresa tu contraseña",
                  labelText: "Contraseña",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "Ingresar",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, "/homePage");
                },//API Y ROUTE AL HOME PAGE
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "CREA UNA CUENTA",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
}
