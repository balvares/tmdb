import 'package:tmdb/app/core/providers/movie_rating/domain/entities/movie_rating_result_entity.dart';

class MovieRatingResultModel extends MovieRatingResultEntity {
  MovieRatingResultModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
    required super.rating,
  });

  factory MovieRatingResultModel.fromJson(Map<String, dynamic> json) =>
      MovieRatingResultModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((x) => x as int)),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        releaseDate: DateTime.parse(json['release_date']),
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        rating: json['rating)'],
      );
}
