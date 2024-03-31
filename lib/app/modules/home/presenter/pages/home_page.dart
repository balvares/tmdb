import 'package:flutter/material.dart';

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
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
                child: TmdbTitle(
              text: 'Header',
            ))
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
