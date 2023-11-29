import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double width;

  final double height;
  MyButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.brown[300], borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          text, // ignore: prefer_const_constructors
          style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )),
      ),
    );
  }
}
