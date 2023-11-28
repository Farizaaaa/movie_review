import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenSize.height / 10,
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text, // ignore: prefer_const_constructors
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )),
      ),
    );
  }
}
