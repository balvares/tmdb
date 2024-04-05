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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.state) {
        case StateType.load:
          return _buildLoading;
        case StateType.error:
          return _buildErrorMessage;
        case StateType.success:
          return Scaffold(
            body: _buildBody,
            appBar: _buildAppBar,
            backgroundColor: TmdbColors.background,
          );
      }
      return Container();
    });
  }

  Widget get _buildLoading => const Center(
        child: CircularProgressIndicator(
          backgroundColor: TmdbColors.background,
          color: TmdbColors.primary,
        ),
      );

  Widget get _buildErrorMessage => Scaffold(
        appBar: _buildAppBar,
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

  PreferredSizeWidget get _buildAppBar => TmdbAppBar(
        key: const Key(homeAppBarKey),
        title: TmdbTitle(text: controller.movieDetail?.title ?? ''),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: TmdbColors.primary),
        ),
      );

  Widget get _buildBody => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackdropImage,
            Padding(
              padding: const EdgeInsets.all(layoutSpace16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle,
                  const SizedBox(height: layoutSpace4),
                  _buildDetails,
                  _buildGenreSection,
                  const Divider(),
                  _buildOverview,
                  _buildTagline,
                  const Divider(),
                  _buildCreditsCarousel,
                  _buildRatingSection,
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _buildBackdropImage => Image.network(
        "${controller.imageUrl}${controller.movieDetail?.backdropPath}",
      );

  Widget get _buildTitle => TmdbTitleGiant(
        text: controller.movieDetail?.title ?? '',
      );

  Widget get _buildDetails => Row(
        children: [
          TmdbLabel(
            fontSize: layoutSpace12,
            color: TmdbColors.neutral3,
            text:
                '${controller.movieDetail?.runtime.toString()}m | ${controller.movieDetail?.releaseDate.year.toString()}',
          ),
        ],
      );

  Widget get _buildGenreSection => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var genre in controller.genreList) _buildGenreChips(genre),
        ],
      );

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

  Widget get _buildOverview => TmdbLabel(
        fontSize: layoutSpace12,
        textAlign: TextAlign.justify,
        text: controller.movieDetail?.overview ?? 'Descrição não informada.',
      );

  Widget get _buildTagline => TmdbLabel(
        fontSize: layoutSpace12,
        textAlign: TextAlign.justify,
        text: controller.movieDetail?.tagline ?? '',
      );

  Widget get _buildCreditsCarousel => SizedBox(
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
            return null;
          },
        ),
      );

  Widget get _buildRatingSection => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRatingValue,
          TmdbButton(
            width: 100,
            label: 'Avaliar',
            fontSize: layoutSpace12,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildRatingDialog;
                },
              );
            },
          ),
        ],
      );

  Widget get _buildRatingValue => TmdbLabel(
        text:
            'Nota: ⭐ ${controller.movieDetail?.voteAverage.toStringAsFixed(1)}/10',
      );

  Widget get _buildRatingDialog => Obx(() {
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
              TmdbLabel(
                  text: 'Nota ${controller.minRatingValue.value.toInt()}!'),
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
