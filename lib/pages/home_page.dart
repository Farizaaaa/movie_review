import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/models/movie_details_model/movie_details_model.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';
import 'package:movie_review/resources/cloud_firestore_methods.dart';
import 'package:movie_review/widgets/dialog_box.dart';
import 'package:movie_review/widgets/movie_review.dart';
import 'package:movie_review/widgets/search_bar_widget.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

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
  Future<QuerySnapshot<Map<String, dynamic>>>? _future;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();

    //getMovie();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDataMovie() async {
    //
    QuerySnapshot<Map<String, dynamic>> _future2 = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("movies")
        .get();
    return _future2;
    //
  }

  //getting data from cloudfirestore
  Future getData() async {
    userDetailsModel = await CloudFirestoreMethods().getName();
    //
    setState(() {
      name = userDetailsModel.name!;
      // _future = _future2;
    });
    print(userDetailsModel.name);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO: implement didChangeDependencies

    getData();
  }

  //add new review
  void addNewReview() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(onCancel: () {
              Navigator.pop(context);
            });
          });
    });
    initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: SearchBarWidget(),
      // AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: const Center(child: Text("MOVIE REVIEW")),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //         },
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorLight),
            alignment: Alignment.centerRight,
            width: screenSize.width,
            height: 40,
            child: Row(
              children: [
                Text(name),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getDataMovie(),
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
        onPressed: addNewReview,
        child: const Icon(Icons.add),
      ),
    );
  }
}
