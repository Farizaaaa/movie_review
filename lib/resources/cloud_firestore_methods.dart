import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';

class CloudFirestoreMethods {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //uploading name and address to cloud_firestore
  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel name}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(name.toJson());
  }

  Future getName() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    print(snap.data());
    UserDetailsModel nameData =
        UserDetailsModel.fromJson(snap.data() as dynamic);
    print(nameData);
    return nameData;
  }
}
