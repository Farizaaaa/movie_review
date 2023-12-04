import 'package:flutter/material.dart';
import 'package:movie_review/pages/search_page.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchBarWidget({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final bool readOnly = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 8.75,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Colors.brown[200]!,
          Theme.of(context).primaryColor,
        ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
      ),
      child: Row(
        children: [
          Container(
            width: size.width / 2,
            height: 45,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ]),
            child: TextField(
              readOnly: readOnly,
              onTap: () {
                if (readOnly) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                }
              },
              decoration: InputDecoration(
                  hintText: "Search movie",
                  fillColor: Theme.of(context).primaryColorLight,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 1))),
            ),
          ),
        ],
      ),
    );
  }
}
