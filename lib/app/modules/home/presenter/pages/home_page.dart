import 'package:flutter/material.dart';
import 'package:tmdb/shared/widgets/tmdb_label.dart';

import '../../../../../shared/shared.dart';
import '../../../../../shared/constants/keys.dart';
import '../../../../../shared/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: TmdbColors.background,
      drawer: Drawer(
        shadowColor: Colors.transparent,
        backgroundColor: TmdbColors.dark,
        child: ListView(
          padding: const EdgeInsets.only(
            top: layoutSpace48,
            left: layoutSpace16,
            right: layoutSpace16,
            bottom: layoutSpace48,
          ),
          children: const <Widget>[
            TmdbTitle(
              text: 'Olá, Bruna! 😀',
              color: TmdbColors.secondary,
              fontSize: layoutSpace24,
            ),
            SizedBox(height: layoutSpace16),
            Divider(color: TmdbColors.primary),
            SizedBox(height: layoutSpace16),
            ListTile(
              title: TmdbLabel(
                text: "Filmes",
                color: TmdbColors.secondary,
              ),
            ),
          ],
        ),
      ),
      appBar: TmdbAppBar(
        key: const Key(homeAppBarKey),
        title: const TmdbTitle(text: "Início"),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu, color: TmdbColors.primary),
        ),
      ),
    );
  }
}
