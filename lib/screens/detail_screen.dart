import 'package:flutter/material.dart';
import 'package:myflix/services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final String backdrop_path, overview, poster_path, title;
  final List<dynamic> genre_ids;
  final double vote_average;
  final int id;
  const DetailScreen(
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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500$poster_path'), // Image.network 대신 NetworkImage 사용
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 10,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.white,
                        size: 30,
                      )),
                  const Text(
                    "Back to list",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )),
          Positioned(
              top: 330,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate,
                        color: Colors.yellow,
                        size: 15,
                      ),
                      Text(
                        "$vote_average",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: ApiService.getGenres(id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> genres = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: /*<Widget>*/ [
                                for (var genre in genres)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 0),
                                    child: Text(
                                      genre,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ) //Text(movie['name'])
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 350,
                    height: 400,
                    child: Text(
                      overview,
                      maxLines: 9,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
