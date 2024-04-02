import '../entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: json['genre_ids'],
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  static List<MovieModel> fromListJson(List<dynamic> listJson) {
    return listJson
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
