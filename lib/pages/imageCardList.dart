import 'package:beta_balmer/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:beta_balmer/logic/activities_bloc.dart';
import 'package:beta_balmer/model/activities.dart';
import 'package:beta_balmer/pages/viewActivity/Page1.dart';

class ImageCardList extends StatefulWidget {
  @override
  _ImageCardListState createState() => _ImageCardListState();
}

class _ImageCardListState extends State<ImageCardList> {
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  //stack1
  Widget imageStack(String img, String title, String type, Activities act) => Stack(
        children: <Widget>[
          Positioned.fill(
              child: GestureDetector(
                onTap: (){
                  print("on Tap");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Page1(activity: act),
                    )
                  );
                },
                child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
              )),
          Positioned(
            bottom: 90.0,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text.rich(
                  TextSpan(
                    text: type,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.9)),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\n$title',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.9))),
                    ],
                  ),
                )),
          ),
        ],
      );
  //stack2
  Widget descStack(Activities activity) => Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(activity.personImage),
                      ),
                      Text(activity.personName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(activity.price,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    Text('Sesiones: ${activity.totalSesion}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ],
                ),
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

  Widget favIcon(Activities act) => Positioned(
        top: 0.0,
        right: 0.0,
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: IconButton(
              icon: new Icon(
                act.favorite ? Icons.favorite : Icons.favorite_border,
                color: act.favorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  if (act.favorite) {
                    act.favorite = false;
                  } else {
                    act.favorite = true;
                  }
                });
              },
            )),
      );

  Widget productGrid(List<Activities> activity) => GridView.count(
        crossAxisCount: 1,
        shrinkWrap: true,
        children: activity
            .map((act) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    splashColor: Colors.yellow,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      elevation: 2.0,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          imageStack(act.image, act.title, act.types, act),
                          descStack(act),
                          ratingStack(act.rating),
                          favIcon(act)
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

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: bodyData(),
    );
  }
}
