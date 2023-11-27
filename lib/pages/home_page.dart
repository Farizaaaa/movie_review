import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/pages/sign_in_page.dart';
import 'package:movie_review/widgets/movie_review.dart';

class MovieHome extends StatelessWidget {
  MovieHome({super.key});
  final user = FirebaseAuth.instance.currentUser!;

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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignIn()));
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
            child: Text(user.email!),
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
