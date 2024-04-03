import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieDetailController controller = Get.find<MovieDetailController>();

  Widget _buildGenreChips(String genre) {
    return Chip(
      label: TmdbLabel(
        text: genre,
        fontSize: layoutSpace12,
      ),
      padding: EdgeInsets.zero,
      color: MaterialStateProperty.all(TmdbColors.dark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(layoutSpace48),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "${controller.imageUrl}${controller.movieDetail['backdrop_path']}",
          ),
          Padding(
            padding: const EdgeInsets.all(layoutSpace16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TmdbTitleGiant(
                  text: "${controller.movieDetail['title']}",
                ),
                const SizedBox(height: layoutSpace4),
                TmdbLabel(
                  fontSize: layoutSpace12,
                  color: TmdbColors.neutral3,
                  text:
                      '${controller.movieDetail['runtime'].toString()}m | ${DateTime.parse(controller.movieDetail['release_date']).year.toString()}',
                ),
                Row(
                  children: [
                    for (var genre in controller.genreList)
                      _buildGenreChips(genre),
                  ],
                ),
                const Divider(),
                const SizedBox(height: layoutSpace120),
                const Divider(),
                TmdbLabel(
                  fontSize: layoutSpace12,
                  textAlign: TextAlign.justify,
                  text: '${controller.movieDetail['overview']}',
                ),
                // const SizedBox(height: layoutSpace12),
                TmdbLabel(
                  fontSize: layoutSpace12,
                  textAlign: TextAlign.justify,
                  text: '${controller.movieDetail['tagline']}',
                ),
                const SizedBox(height: layoutSpace48),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return TmdbAppBar(
      key: const Key(homeAppBarKey),
      title: TmdbTitle(text: controller.movieDetail['title']),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back,
          color: TmdbColors.primary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
      backgroundColor: TmdbColors.background,
    );
  }
}