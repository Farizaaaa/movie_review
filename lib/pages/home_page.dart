import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/models/movie_details_model/movie_details_model.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';
import 'package:movie_review/pages/page_layout.dart';
import 'package:movie_review/pages/sign_in_page.dart';
import 'package:movie_review/resources/cloud_firestore_methods.dart';
import 'package:movie_review/widgets/dialog_box.dart';
import 'package:movie_review/widgets/movie_review.dart';

class MovieHome extends StatefulWidget {
  
  MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  final user = FirebaseAuth.instance.currentUser!;
  UserDetailsModel userDetailsModel = UserDetailsModel();
  CloudFirestoreMethods cloudFirestoreMethods = CloudFirestoreMethods();
  MovieDetailsModel movieDetailsModel = MovieDetailsModel();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  int? length;
  String name = "Name";

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();
    //getMovie();
  }

  //getting data from cloudfirestore
  Future getData() async {
    userDetailsModel = await CloudFirestoreMethods().getName();
    setState(() {
      name = userDetailsModel.name!;
    });
    print(userDetailsModel.name);
  }

  //add new review
  void addNewReview() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
             
              onCancel: () {
                Navigator.pop(context);
              });
        });
  }

  //saveMovie{
  

  // //getting movie data
  // void getMovie() async {
  //   // Stream<QuerySnapshot<Map<String, dynamic>>> snap =
  //   //     await cloudFirestoreMethods.getMovie();
  //   int length = await cloudFirestoreMethods.getMovieDetailsLength();
  //   setState(() {
  //     //movieDetailsModel = getMovie;
  //     length = length;
  //   });
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(child: Text("MOVIE REVIEW")),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageLayout()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorLight),
            alignment: Alignment.centerRight,
            width: screenSize.width,
            height: 40,
            child: Text(name),
          ),
          Expanded(
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("users")
                    .doc(firebaseAuth.currentUser!.uid)
                    .collection("movies")
                    .get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    return ListView.builder(
                      itemCount: snap.data!.docs.length,
                      itemBuilder: (context, index) {
                        MovieDetailsModel movieDetailsModel =
                            MovieDetailsModel.fromJson(
                                snap.data!.docs[index].data());
                        return MovieReview(
                            movieDetailsModel: movieDetailsModel);
                      },
                    );
                  }
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: addNewReview,
      ),
    );
  }
}
