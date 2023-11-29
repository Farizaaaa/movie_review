import 'package:flutter/material.dart';
import 'package:movie_review/pages/sign_in_page.dart';
import 'package:movie_review/pages/sign_up_page.dart';

class SignInOrUp extends StatefulWidget {
  const SignInOrUp({super.key});

  @override
  State<SignInOrUp> createState() => _SignInOrUpState();
}

class _SignInOrUpState extends State<SignInOrUp> {
  //inoitailly show sign in page
  bool showSignInPage = true;

  //toggle btw sign in and up
  void togglePages() {
    showSignInPage = !showSignInPage;
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return SignIn(
        onTap: togglePages,
      );
    } else {
      return SignUp(
        onTap: togglePages,
      );
    }
  }
}
