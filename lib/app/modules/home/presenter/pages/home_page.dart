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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.find<HomeController>();

  Widget _buildBody() {
    return TabBarView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.8,
            ),
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${controller.items[index]["poster_path"]}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: TmdbLabel(
                      fontSize: 10,
                      text: controller.items[index]["original_title"],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.8,
            ),
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${controller.items[index]["poster_path"]}",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: TmdbLabel(
                      fontSize: 10,
                      text: controller.items[index]["original_title"],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return TmdbAppBar(
      key: const Key(homeAppBarKey),
      title: const TmdbTitle(text: "Início"),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: TmdbColors.primary),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      bottom: const TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: TmdbColors.primary,
        tabs: [
          Tab(child: TmdbLabel(text: 'Em cartaz', fontSize: 12)),
          Tab(child: TmdbLabel(text: 'Popular', fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: _buildAppBar(),
        drawer: const TmdbDrawer(),
        backgroundColor: TmdbColors.background,
        body: _buildBody(),
      ),
    );
  }
}
