import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../controllers/home_controller.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();

  Widget _buildTabPopular() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
        ),
        itemCount: controller.popularMovies!.result.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Image.network(
                  "${controller.imageUrl}${controller.popularMovies!.result[index].posterPath}",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: TmdbLabel(
                    fontSize: controller.fontSize,
                    text: controller.popularMovies!.result[index].title,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabUpcoming() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
        ),
        itemCount: controller.upcomingMovies!.result.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Image.network(
                  "${controller.imageUrl}${controller.upcomingMovies!.result[index].posterPath}",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: TmdbLabel(
                    fontSize: controller.fontSize,
                    text: controller.upcomingMovies!.result[index].title,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        _buildTabPopular(),
        _buildTabUpcoming(),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return TmdbAppBar(
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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: _buildAppBar(),
        drawer: const TmdbDrawer(),
        backgroundColor: TmdbColors.background,
        body: _buildBody(),
      ),
    );
  }
}
