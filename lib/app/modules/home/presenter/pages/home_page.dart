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
  final List<String> items = [
    'filme1',
    'filme2',
    'filme3',
    'filme4',
  ];

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return const Card(
            child: Center(
              child: Text(
                'aaaaaaa', // Texto do item
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(),
      drawer: const TmdbDrawer(),
      backgroundColor: TmdbColors.background,
      body: _buildBody(),
    );
  }
}
