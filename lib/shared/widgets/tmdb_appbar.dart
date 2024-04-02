import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TmdbAppBar({
    super.key,
    required this.title,
    required this.leading,
    this.bottom,
  });

  final Widget title;
  final Widget leading;
  final dynamic bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      bottom: bottom,
      leading: leading,
      backgroundColor: TmdbColors.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
