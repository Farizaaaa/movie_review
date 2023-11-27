import 'package:flutter/material.dart';
import 'package:movie_review/pages/sign_in_page.dart';
import 'package:movie_review/resources/authentication_methods.dart';
import 'package:movie_review/widgets/my_button.dart';
import 'package:movie_review/widgets/my_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cPwdController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  //sign in
  void signUp() async {
    String output = await authenticationMethods.signUp(
        name: nameController.text,
        email: emailController.text,
        password: pwdController.text,
        cpassword: cPwdController.text);
    if (output == "success") {
      print(output);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
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
                  controller: nameController,
                  hintText: "Enter Name",
                  obscureText: false),
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
                  hintText: "Enter password",
                  obscureText: true),
              SizedBox(
                height: size.height / 35,
              ),
              MyTextField(
                  controller: cPwdController,
                  hintText: "Re Enter Password",
                  obscureText: true),
              SizedBox(
                height: size.height / 35,
              ),
              MyButton(onTap: signUp, text: "Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
