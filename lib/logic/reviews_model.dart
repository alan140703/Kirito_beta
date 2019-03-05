import 'package:beta_balmer/model/reviews.dart';

class ReviewModelBloc {

  List<Reviews> reviewsItems;

  ReviewModelBloc({this.reviewsItems});

  getReviews() => <Reviews>[
          Reviews(
            idReview: 1,
            personImage: "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4",
            personName: "Juan perez",       
            review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            rating: 3.0,
          ),
          Reviews(
            idReview: 2,
            personImage: "https://cdn.pixabay.com/photo/2016/04/01/09/51/actor-1299629_960_720.png",
            personName: "Carlos Flores",
            review: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
           
            rating: 4.0,
          ),

           
      ];
  
}