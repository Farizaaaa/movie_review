import 'package:flutter/material.dart';
import 'package:movie_review/widgets/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: SearchBarWidget());
  }
}
