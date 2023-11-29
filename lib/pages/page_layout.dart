import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/pages/home_page.dart';
import 'package:movie_review/pages/sign_in_or_up.dart';

class PageLayout extends StatelessWidget {
  const PageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        if(snapshot.hasData){
          return MovieHome();
        }else{
          return SignInOrUp();
        }
      }),
    );
  }
}