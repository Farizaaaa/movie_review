import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/models/user_details_model/user_details_model.dart';
import 'package:movie_review/pages/sign_in_page.dart';
import 'package:movie_review/resources/cloud_firestore_methods.dart';
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

  String name = "Name";

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();
  }

  Future getData() async {
    userDetailsModel = await CloudFirestoreMethods().getName();
    setState(() {
      name = userDetailsModel.name!;
    });
    print(userDetailsModel.name);
  }

  //data list
  final List movieReview = [
    {"name": "SuraraiPottru", "review": "Nice film"}
  ];

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
                    MaterialPageRoute(builder: (context) => const SignIn()));
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
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const MovieReview();
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
