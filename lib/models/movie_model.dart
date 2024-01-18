class MovieModel {
  final String backdrop_path, overview, poster_path, title;
  final List<dynamic> genre_ids;
  final double vote_average;
  final int id;

  MovieModel(
      {required this.backdrop_path,
      required this.overview,
      required this.poster_path,
      required this.title,
      required this.genre_ids,
      required this.vote_average,
      required this.id});
}
