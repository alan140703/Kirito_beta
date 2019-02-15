import 'dart:async';

import 'package:beta_balmer/logic/activities_view_model.dart';
import 'package:beta_balmer/model/activities.dart';

class ActivitiesBloc {
  final ActivitiesViewModel activitiesViewModel = ActivitiesViewModel();
  final activitiesController = StreamController<List<Activities>>();
  Stream<List<Activities>> get activitiesItems => activitiesController.stream;

  ActivitiesBloc() {
    activitiesController.add(activitiesViewModel.getActivities());
  }
}