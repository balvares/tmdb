import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../../core/shared/enum/state.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../controllers/movie_detail_controller.dart';
import '../../../../core/shared/utils/enviroment.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MovieDetailController controller = Get.find<MovieDetailController>();

  Widget _buildRatingValue() {
    return TmdbLabel(
      text:
          'Nota: ⭐ ${controller.movieDetail?.voteAverage.toStringAsFixed(1)}/10',
    );
  }

  Widget _buildCreditsCarousel() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.movieCredits?.length,
        itemBuilder: (BuildContext context, int index) {
          final credit = controller.movieCredits?[index];
          if (credit?.profilePath != null) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "${Environment.imageUrl}${credit?.profilePath}",
                    width: 100,
                  ),
                  const SizedBox(height: 4),
                  TmdbLabel(
                    fontSize: 8,
                    text: credit?.name ?? '',
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildBackdropImage() {
    return Image.network(
      "${controller.imageUrl}${controller.movieDetail?.backdropPath}",
    );
  }

  Widget _buildTitle() {
    return TmdbTitleGiant(
      text: controller.movieDetail?.title ?? '',
    );
  }

  Widget _buildDetails() {
    return Row(
      children: [
        TmdbLabel(
          fontSize: layoutSpace12,
          color: TmdbColors.neutral3,
          text:
              '${controller.movieDetail?.runtime.toString()}m | ${controller.movieDetail?.releaseDate.year.toString()}',
        ),
      ],
    );
  }

  Widget _buildGenreSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var genre in controller.genreList) _buildGenreChips(genre),
      ],
    );
  }

  Widget _buildGenreChips(String genre) {
    return Container(
      margin: const EdgeInsets.only(right: layoutSpace4),
      child: Chip(
        label: TmdbLabel(text: genre, fontSize: layoutSpace12),
        padding: EdgeInsets.zero,
        color: MaterialStateProperty.all(TmdbColors.dark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(layoutSpace48),
        ),
      ),
    );
  }

  Widget _buildOverview() {
    return TmdbLabel(
      fontSize: layoutSpace12,
      textAlign: TextAlign.justify,
      text: controller.movieDetail?.overview ?? 'Descrição não informada.',
    );
  }

  Widget _buildTagline() {
    return TmdbLabel(
      fontSize: layoutSpace12,
      textAlign: TextAlign.justify,
      text: controller.movieDetail?.tagline ?? '',
    );
  }

  Widget _buildRatingSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingValue(),
        TmdbButton(
          width: 100,
          label: 'Avaliar',
          fontSize: layoutSpace12,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildRatingDialog();
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildRatingDialog() {
    return Obx(() {
      return AlertDialog(
        backgroundColor: TmdbColors.dark,
        title: const TmdbLabel(
          text: 'De 1 a 10, que nota você dá para este filme?',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Slider(
              value: controller.minRatingValue.value,
              min: 1.0,
              max: 10.0,
              divisions: 9,
              onChanged: (double value) {
                controller.minRatingValue.value = value;
              },
            ),
            TmdbLabel(text: 'Nota ${controller.minRatingValue.value.toInt()}!'),
          ],
        ),
        actions: <Widget>[
          TmdbButton(
            label: 'Cancelar',
            onPressed: () => Get.back(),
          ),
          TmdbButton(
            label: 'Enviar',
            onPressed: () {
              print('Valor selecionado: ${controller.minRatingValue.value}');
              Get.back();
            },
          ),
        ],
      );
    });
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: TmdbColors.background,
        color: TmdbColors.primary,
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: TmdbColors.background,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TmdbTitle(
              text: 'Oops! Não foi possível carregar este título.',
            ),
            TmdbLabel(
              fontSize: 12,
              color: TmdbColors.defaultTextColor,
              text: 'Por gentileza, tente novamente mais tarde.',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackdropImage(),
          Padding(
            padding: const EdgeInsets.all(layoutSpace16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: layoutSpace4),
                _buildDetails(),
                _buildGenreSection(),
                const Divider(),
                _buildOverview(),
                _buildTagline(),
                const Divider(),
                _buildCreditsCarousel(),
                _buildRatingSection(),
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
      title: TmdbTitle(text: controller.movieDetail?.title ?? ''),
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
    return Obx(() {
      switch (controller.state) {
        case StateType.empty:
          return Scaffold(
            body: _buildBody(),
            appBar: _buildAppBar(),
            backgroundColor: TmdbColors.background,
          );
        case StateType.load:
          return _buildLoading();
        case StateType.success:
          return _buildErrorMessage();
      }
      return Container();
    });
  }
}
