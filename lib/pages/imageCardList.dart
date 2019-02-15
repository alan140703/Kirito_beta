//import 'package:beta_balmer/logic/product_bloc.dart';
//import 'package:beta_balmer/model/product.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/logic/activities_bloc.dart';
import 'package:beta_balmer/model/activities.dart';
//import 'package:flutter_uikit/logic/bloc/product_bloc.dart';
//import 'package:flutter_uikit/model/product.dart';
//import 'package:flutter_uikit/ui/widgets/common_scaffold.dart';

class ImageCardList extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  //stack1
  Widget imageStack(String img, String title) => Stack(
        children: <Widget>[
          Positioned.fill(
              child: Image.network(
            img,
            fit: BoxFit.cover,
          )),
          Positioned(
            bottom: 55.0,
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ],
      );

  /*Stack(
    //alignment: const Alignment(0, 0),
    children: [
      Image.network(img, fit: BoxFit.fitWidth,),
      Container(
        alignment: Alignment(-1.0, 0.6),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );*/

  //stack2
  Widget descStack(Activities activity) => Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(activity.personImage),
                ),
                Text(activity.personName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    )),
                Text(activity.price,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    )),
                /*Text("Sesiones: ${activity.totalSesion}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    )),*/
              ],
            ),
          ),
        ),
      );

  //stack3
  Widget ratingStack(double rating) => Positioned(
        top: 0.0,
        left: 0.0,
        child: Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellowAccent,
                size: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                rating.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10.0),
              )
            ],
          ),
        ),
      );

  Widget productGrid(List<Activities> activity) => GridView.count(
        crossAxisCount: 1,
        shrinkWrap: true,
        children: activity
            .map((act) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    splashColor: Colors.yellow,
                    onDoubleTap: () => showSnackBar(),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2.0,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          imageStack(act.image, act.title),
                          descStack(act),
                          ratingStack(act.rating),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      );

  Widget bodyData() {
    ActivitiesBloc activitiesBloc = ActivitiesBloc();
    return StreamBuilder<List<Activities>>(
        stream: activitiesBloc.activitiesItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? productGrid(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  void showSnackBar() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Added to cart.",
      ),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: bodyData(),
    );
  }
}
