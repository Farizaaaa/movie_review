import 'package:flutter/material.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';
import 'package:movie_review/resources/cloud_firestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel? userDetailsModel;
  Future getUserData() async {
    userDetailsModel = await CloudFirestoreMethods().getName();
    print(userDetailsModel!.name);
    notifyListeners();
  }

  UserDetailsProvider({this.userDetailsModel});
}
