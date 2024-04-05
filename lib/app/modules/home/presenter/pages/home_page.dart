import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../controllers/home_controller.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/shared/enum/state.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(() {
        switch (controller.state) {
          case StateType.load:
            return _buildLoading;
          case StateType.error:
            return _buildErrorMessage;
          case StateType.success:
            return Scaffold(
              appBar: _buildAppBar,
              body: _buildBody,
              drawer: const TmdbDrawer(),
              key: controller.scaffoldKey,
              backgroundColor: TmdbColors.background,
            );
        }
        return Container();
      }),
    );
  }

  Widget get _buildLoading => const Center(
        child: CircularProgressIndicator(
          key: Key(homeLoadingKey),
          color: TmdbColors.primary,
          backgroundColor: TmdbColors.background,
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
                key: Key(homeErrorTitleKey),
                text: 'Oops! Não foi possível carregar a lista de títulos.',
                textAlign: TextAlign.center,
              ),
              TmdbLabel(
                fontSize: 12,
                key: Key(homeErrorSubtitleKey),
                color: TmdbColors.defaultTextColor,
                text: 'Por gentileza, tente novamente mais tarde.',
              )
            ],
          ),
        ),
      );

  PreferredSizeWidget get _buildAppBar => TmdbAppBar(
        height: kToolbarHeight + 48,
        key: const Key(homeAppBarKey),
        title: const TmdbTitle(text: "Início"),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: TmdbColors.primary),
          onPressed: () => controller.scaffoldKey.currentState!.openDrawer(),
        ),
        bottom: const TabBar(
          dividerColor: Colors.transparent,
          indicatorColor: TmdbColors.primary,
          tabs: [
            Tab(child: TmdbLabel(text: 'Populares', fontSize: 12)),
            Tab(child: TmdbLabel(text: 'Em breve', fontSize: 12)),
          ],
        ),
      );

  Widget get _buildBody => TabBarView(
        key: const Key(homeTabBarKey),
        children: [
          _buildTabPopular,
          _buildTabUpcoming,
        ],
      );

  Widget get _buildTabPopular => Padding(
        key: const Key(homeTabPopularKey),
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: controller.popularMovies?.result.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.8,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // todo mandar pra controller e adicionar validação de id nulo
                Get.toNamed(Routes.movieDetail, parameters: {
                  "id": controller.popularMovies?.result[index].id.toString() ??
                      ''
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    key: const Key(homeTabPopularCardBackdropKey),
                    child: Image.network(
                      "${controller.imageUrl}${controller.popularMovies?.result[index].posterPath ?? ''}",
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: TmdbLabel(
                        key: const Key(homeTabPopularCardTitleKey),
                        fontSize: controller.fontSize,
                        text:
                            controller.popularMovies?.result[index].title ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

  Widget get _buildTabUpcoming => Padding(
        key: const Key(homeTabUpcomingKey),
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.8,
          ),
          itemCount: controller.upcomingMovies?.result.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.movieDetail, parameters: {
                  "id":
                      controller.upcomingMovies?.result[index].id.toString() ??
                          ''
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Stack(
                      key: const Key(homeTabUpcomingCardBackdropKey),
                      children: [
                        Image.network(
                          "${controller.imageUrl}${controller.upcomingMovies?.result[index].posterPath}",
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            color: TmdbColors.darkTextColor,
                            child: TmdbLabel(
                              fontSize: controller.fontSize,
                              key: const Key(homeTabUpcomingCardReleaseDateKey),
                              text: DateFormat('dd/MM/yyyy').format(controller
                                  .upcomingMovies!.result[index].releaseDate),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: TmdbLabel(
                        fontSize: controller.fontSize,
                        key: const Key(homeTabUpcomingCardTitleKey),
                        text: controller.upcomingMovies?.result[index].title ??
                            '',
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
