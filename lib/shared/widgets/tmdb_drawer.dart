import 'package:flutter/material.dart';

import 'widgets.dart';
import '../shared.dart';

class TmdbDrawer extends StatelessWidget {
  const TmdbDrawer({
    super.key,
    this.title = 'Olá, Bruna! 😀',
    this.backgroundColor = TmdbColors.dark,
    this.padding = const EdgeInsets.only(
      top: layoutSpace48,
      left: layoutSpace16,
      right: layoutSpace16,
      bottom: layoutSpace48,
    ),
  });

  final String title;
  final EdgeInsets padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      child: ListView(
        padding: padding,
        children: <Widget>[
          TmdbTitle(
            text: title,
            fontSize: layoutSpace24,
            color: TmdbColors.secondary,
          ),
          const SizedBox(height: layoutSpace16),
          const Divider(color: TmdbColors.primary),
          const SizedBox(height: layoutSpace16),
          const ListTile(
            title: TmdbLabel(
              text: "Filmes",
              color: TmdbColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
