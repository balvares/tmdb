class MovieRatingRequest {
  final double value;

  MovieRatingRequest({
    required this.value,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'value': value,
      };
}
