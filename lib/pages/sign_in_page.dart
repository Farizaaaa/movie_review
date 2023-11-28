import 'package:flutter/material.dart';
import 'package:movie_review/pages/home_page.dart';
import 'package:movie_review/pages/sign_up_page.dart';
import 'package:movie_review/resources/authentication_methods.dart';
import 'package:movie_review/widgets/my_button.dart';
import 'package:movie_review/widgets/my_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  //sign in
  void signIn() async {
    String output = await authenticationMethods.signIn(
        email: emailController.text, password: pwdController.text);
    if (output == "success") {
      print(output);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MovieHome()));
    } else {
      print(output);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 35,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Enter Email",
                  obscureText: false),
              SizedBox(
                height: size.height / 35,
              ),
              MyTextField(
                  controller: pwdController,
                  hintText: "Enter Password",
                  obscureText: true),
              SizedBox(
                height: size.height / 35,
              ),
              MyButton(onTap: signIn, text: "Sign In"),
              SizedBox(
                height: size.height / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user?  "),
                  TextButton(
                    child: Text(
                      "SignUp",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
