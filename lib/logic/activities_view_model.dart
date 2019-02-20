import 'package:flutter/material.dart';
import 'package:beta_balmer/model/activities.dart';

class ActivitiesViewModel {
  
  List<Activities> activitiesItems;

  ActivitiesViewModel({this.activitiesItems});

  getActivities() => <Activities>[
          Activities(
            personImage: "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4",
            personName: "VO Arquitectura",
            image: "https://i.pinimg.com/originals/b9/17/aa/b917aaffae32fc178d8590467df960b0.jpg",
            title: "iluminacion arquitectonica y ambiental",
            rating: 4.9,
            price: "\$ 3,500 MXN",
            types: "Taller",
            totalSesion: 20,
            quantity: 0,
          ),
          Activities(
            personImage: "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            personName: "Carlos Flores",
            image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDAIzsdhpslqjOA6mtB9Mon0uMPFw78BOROADlVq2aBjwvaQlXZw",
            title: "Fotografia por Dummies",
            rating: 4.5,
            price: "\$ 1,200 MXN",
            types: "Curso",
            totalSesion: 10,
            quantity: 0,
          ),

           
      ];
}