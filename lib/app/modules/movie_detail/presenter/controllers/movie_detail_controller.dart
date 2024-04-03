import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/utils/enviroment.dart';

class MovieDetailController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final imageUrl = Environment.imageUrl;

  final Map<String, dynamic> movieDetail = {
    "adult": false,
    "backdrop_path": "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg",
    "belongs_to_collection": null,
    "budget": 135000000,
    "genres": [
      {"id": 28, "name": "Ação"},
      {"id": 878, "name": "Ficção científica"},
      {"id": 12, "name": "Aventura"}
    ],
    "homepage": "",
    "id": 823464,
    "imdb_id": "tt14539740",
    "original_language": "en",
    "original_title": "Godzilla x Kong: The New Empire",
    "overview":
        "O poderoso Kong e o temível Godzilla se unem contra uma colossal ameaça mortal escondida no mundo dos humanos, que ameaça a existência de sua espécie e da nossa. Mergulhando profundamente nos mistérios da Ilha da Caveira e nas origens da Terra Oca, o filme irá explorar a antiga batalha de Titãs que ajudou a forjar esses seres extraordinários e os ligou à humanidade para sempre.",
    "popularity": 5072.084,
    "poster_path": "/kO6K9zEsKhNyqcrdGTSqAI6jrie.jpg",
    "production_companies": [
      {
        "id": 923,
        "logo_path": "/8M99Dkt23MjQMTTWukq4m5XsEuo.png",
        "name": "Legendary Pictures",
        "origin_country": "US"
      },
      {
        "id": 174,
        "logo_path": "/zhD3hhtKB5qyv7ZeL4uLpNxgMVU.png",
        "name": "Warner Bros. Pictures",
        "origin_country": "US"
      }
    ],
    "production_countries": [
      {"iso_3166_1": "US", "name": "United States of America"}
    ],
    "release_date": "2024-03-27",
    "revenue": 194000000,
    "runtime": 115,
    "spoken_languages": [
      {"english_name": "English", "iso_639_1": "en", "name": "English"}
    ],
    "status": "Released",
    "tagline": "Levantem-se juntos ou caiam sozinhos.",
    "title": "Godzilla e Kong: O Novo Império",
    "video": false,
    "vote_average": 6.808,
    "vote_count": 274
  };
  final List<String> genreList = [];

  @override
  void onReady() {
    for (var genre in movieDetail['genres']) {
      genreList.add(genre['name']);
    }
    super.onReady();
  }
}
