import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
//signin
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> signIn({required email, required password}) async {
    email.trim();
    password.trim();

    String output = "Something went Wrong!!";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.code.toString();
      }
    } else {
      output = "Please fill out all fields";
    }

    return output;
  }

//signUp

  Future<String> signUp(
      {required name,
      required email,
      required password,
      required cpassword}) async {
    String output = "Something went wrong";
    name.trim();
    email.trim();
    password.trim();
    cpassword.trim();
    if (name != "" && email != "" && password != "" && cpassword != "") {
      if (password == cpassword) {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
            output="success";
      } else {
        output = "Passwords do not match";
      }
    } else {
      output = "Please fill out all the fields";
    }

    return output;
  }
}
