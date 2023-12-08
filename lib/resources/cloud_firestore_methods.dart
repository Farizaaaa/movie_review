import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_review/models/movie_details_model/movie_details_model.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';
import 'package:movie_review/utils/utils.dart';

class CloudFirestoreMethods {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int? length;
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

  Future<String> uploadMovieToDatabase(
      {required String movieName,
      required String movieReview,
      required int like,
      required Uint8List movieUrl}) async {
    movieName.trim();
    movieReview.trim();

    String output = "Something went wrong while uploading movie";
    String uid = Utils().getUid();
    String url = await uploadImageToDatabase(image: movieUrl, uid: uid);
    if (movieName != "" && movieReview != "" && movieUrl != "" && like != "") {
      try {
        //get model
        MovieDetailsModel movieDetailsModel = MovieDetailsModel(
            movieName: movieName,
            movieReview: movieReview,
            movieUrl: url,
            like: like);
        //upload
        await firebaseFirestore
            .collection("users")
            .doc(firebaseAuth.currentUser!.uid)
            .collection("movies")
            .doc(uid)
            .set(movieDetailsModel.toJson());
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.code.toString();
      }
    } else {
      output = "please fill out all fields";
    }
    return output;
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("users").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    //print(task.ref.getDownloadURL());
    return task.ref.getDownloadURL();
  }
  

//   Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMovie() async {

// //     Stream<QuerySnapshot<Map<String, dynamic>>> snap = await FirebaseFirestore.instance
// //         .collection("users")
// //         .doc(firebaseAuth.currentUser!.uid)
// //         .collection("movies")
// //          .get();
// //     // MovieDetailsModel movieDetailsModel = MovieDetailsModel();
// //     // setMovieDetailsLength(length:snap.docs.length);
// //     // for (int i = 0; i < snap.docs.length; i++) {
// //     //   DocumentSnapshot snapDoc = snap.docs[i];
// //     //   movieDetailsModel = MovieDetailsModel.fromJson(snapDoc.data() as dynamic);
// //     //   //movies.add(MovieReview(movieDetailsModel:movieDetailsModel));
// //     // }
// //     return snap;
// // //return movies;
// //   }

  // void setMovieDetailsLength({required int length}) async{
  //    length= await length;
  // }
  // int getMovieDetailsLength(){
  //   return length!;
  // }
}
