import 'package:flutter/material.dart';

class MovieReview extends StatelessWidget {
  const MovieReview({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Container(
        height: screenSize.height / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).primaryColorLight),
        child: Row(children: [
          Container(
            height: screenSize.height / 4,
            width: screenSize.width / 3,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Cstm6OmgohpjAXqQfpPepVhWD1kxeHzuUg&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: screenSize.width / 17.5,
          ),
          Column(
            children: [
              SizedBox(
                height: screenSize.height / 70,
              ),
              Text(
                "Movie name",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 24),
              ),
              SizedBox(
                height: screenSize.height / 70,
              ),
              Text(
                "Movie reviewwwww",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 12),
              ),
            ],
          )
        ]),
        // child: ListTile(
        //   tileColor: Theme.of(context).primaryColorLight,
        //   contentPadding: const EdgeInsets.all(12.0),
        //   leading: Container(
        //     //  height: screenSize.height / 5,
        //     width: screenSize.width / 3,
        //     clipBehavior: Clip.hardEdge,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        //     child: Image.network(
        //       "",
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   title: const Text("Movie name"),
        //   subtitle: const Text("Movie reviewwwww"),
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
