import 'package:flutter/material.dart';
import 'package:movie_review/models/movie_details_model/movie_details_model.dart';

class MovieReview extends StatelessWidget {
  //also
  final MovieDetailsModel movieDetailsModel;
  //it is easy we only require one

  const MovieReview({super.key, required this.movieDetailsModel, r});

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
              "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
              //movieDetailsModel.movieUrl!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: screenSize.width / 17.5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height / 70,
              ),
              Text(
                movieDetailsModel.movieName!,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 24),
              ),
              SizedBox(
                height: screenSize.height / 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  movieDetailsModel.movieReview!,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              ),
              SizedBox(
                height: screenSize.height / 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Text(
                  "like",
                  // "$movieDetailsModel.like",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
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
