class MovieRatingEntity {
  final int page;
  final List results;
  final int totalPages;
  final int totalResults;

  MovieRatingEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
