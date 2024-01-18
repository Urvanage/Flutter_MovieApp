import 'package:flutter/material.dart';
import 'package:myflix/models/movie_model.dart';
import 'package:myflix/screens/detail_screen.dart';
import 'package:myflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMoives();
  final Future<List<MovieModel>> playingMovies = ApiService.getPlayingMoives();
  final Future<List<MovieModel>> comingMovies = ApiService.getComingMoives();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Popular Movies",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var movie in snapshot.data!)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            backdrop_path: movie.backdrop_path,
                                            overview: movie.overview,
                                            poster_path: movie.poster_path,
                                            title: movie.title,
                                            genre_ids: movie.genre_ids,
                                            vote_average: movie.vote_average,
                                            id: movie.id)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Now in Cinemas",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: playingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (var movie in snapshot.data!)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              backdrop_path:
                                                  movie.backdrop_path,
                                              overview: movie.overview,
                                              poster_path: movie.poster_path,
                                              title: movie.title,
                                              genre_ids: movie.genre_ids,
                                              vote_average: movie.vote_average,
                                              id: movie.id)));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        movie.title,
                                        maxLines: 3,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                              width: 20), // 각 Column 사이에 20 포인트 간격 추가
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const Text(
                "Coming soon",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: comingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (var movie in snapshot.data!)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              backdrop_path:
                                                  movie.backdrop_path,
                                              overview: movie.overview,
                                              poster_path: movie.poster_path,
                                              title: movie.title,
                                              genre_ids: movie.genre_ids,
                                              vote_average: movie.vote_average,
                                              id: movie.id)));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movie.backdrop_path}',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        movie.title,
                                        maxLines: 3,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(
                              width: 20), // 각 Column 사이에 20 포인트 간격 추가
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
