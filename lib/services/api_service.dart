import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String now = "now-playing";
  static const String coming = "coming-soon";
  static const String genreUrl =
      "https://movies-api.nomadcoders.workers.dev/movie?id=";

  static Future<List<MovieModel>> getPopularMoives() async {
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> moviesData = data['results'];

      List<MovieModel> movies = moviesData.map((movieData) {
        return MovieModel(
            backdrop_path: movieData['backdrop_path'],
            overview: movieData['overview'],
            poster_path: movieData['poster_path'],
            title: movieData['title'],
            genre_ids: List<dynamic>.from(movieData['genre_ids']),
            vote_average: movieData['vote_average'].toDouble(),
            id: movieData['id']);
      }).toList();

      /*for (var movie in movies) {
        print(movie.title);
      }*/
      return movies;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPlayingMoives() async {
    final url = Uri.parse('$baseUrl/$now');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> moviesData = data['results'];

      List<MovieModel> movies = moviesData.map((movieData) {
        return MovieModel(
            backdrop_path: movieData['backdrop_path'],
            overview: movieData['overview'],
            poster_path: movieData['poster_path'],
            title: movieData['title'],
            genre_ids: List<dynamic>.from(movieData['genre_ids']),
            vote_average: movieData['vote_average'].toDouble(),
            id: movieData['id']);
      }).toList();

      /*for (var movie in movies) {
        print(movie.title);
      }*/
      return movies;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingMoives() async {
    final url = Uri.parse('$baseUrl/$coming');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> moviesData = data['results'];

      List<MovieModel> movies = moviesData.map((movieData) {
        return MovieModel(
            backdrop_path: movieData['backdrop_path'],
            overview: movieData['overview'],
            poster_path: movieData['poster_path'],
            title: movieData['title'],
            genre_ids: List<dynamic>.from(movieData['genre_ids']),
            vote_average: movieData['vote_average'].toDouble(),
            id: movieData['id']);
      }).toList();

      /*for (var movie in movies) {
        print(movie.title);
      }*/
      return movies;
    }
    throw Error();
  }

  static Future<List<String>> getGenres(int id) async {
    final url = Uri.parse('$genreUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> genresData = data['genres'];
      List<String> genreNames =
          genresData.map((genre) => genre["name"].toString()).toList();
      return genreNames;
    }
    throw Error();
  }
}
