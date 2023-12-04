import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movie_review/resources/cloud_firestore_methods.dart';
import 'package:movie_review/utils/utils.dart';
import 'package:movie_review/widgets/my_button.dart';

class DialogBox extends StatefulWidget {
  final Function()? onCancel;

  const DialogBox({super.key, required this.onCancel});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  CloudFirestoreMethods cloudFirestoreMethods = CloudFirestoreMethods();
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  Uint8List? img;

  void saveMovie() async {
    String output = await cloudFirestoreMethods.uploadMovieToDatabase(
        movieName: nameController.text,
        movieReview: reviewController.text,
        like: 0,
        movieUrl: img!);
    print(output);
    if (output == "success") {
      print(output);
      nameController.clear();
      reviewController.clear();
      Navigator.pop(context);
    } else {
      print(output);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        content: Container(
          height: screenSize.height / 1.8,
          width: screenSize.width / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                controller: nameController,
                text: "Enter the movie name",
                line: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Upload Movie Image:",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Stack(
                    children: [
                      img == null
                          ? Container()
                          : Container(
                              height: 90,
                              width: 100,
                              child: Image.memory(
                                img!,
                                fit: BoxFit.cover,
                              )),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: IconButton(
                            onPressed: () async {
                              Uint8List? temp = await Utils().pickImage();
                              if (temp != null) {
                                setState(() {
                                  img = temp;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.file_upload,

                              shadows: [
                                BoxShadow(
                                    color: Theme.of(context).primaryColorLight)
                              ],
                              //color: Theme.of(context).primaryColorLight,
                            )),
                      )
                    ],
                  ),
                ],
              ),
              MyTextField(
                  controller: reviewController,
                  text: "Enter the review",
                  line: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                      onTap: saveMovie, text: "Save", height: 50, width: 100),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(
                      onTap: widget.onCancel,
                      text: "Cancel",
                      height: 50,
                      width: 100)
                ],
              )
            ],
          ),
        ));
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.line,
      required this.text});

  final TextEditingController controller;
  final int line;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: line,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: Theme.of(context).primaryColorLight,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }
}
