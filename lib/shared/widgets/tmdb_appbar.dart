import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TmdbAppBar({
    super.key,
    required this.title,
    required this.leading,
  });

  final Widget title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: TmdbColors.background,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
