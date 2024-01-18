import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  final String backdrop_path, overview, poster_path, title;
  final List<dynamic> genre_ids;
  final double vote_average;
  final int id;
  const Movie(
      {super.key,
      required this.backdrop_path,
      required this.overview,
      required this.poster_path,
      required this.title,
      required this.genre_ids,
      required this.vote_average,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
