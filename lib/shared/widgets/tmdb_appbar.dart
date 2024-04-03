import 'package:flutter/material.dart';

import '../shared.dart';

class TmdbAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TmdbAppBar({
    super.key,
    required this.title,
    required this.leading,
    this.bottom,
    this.height = kToolbarHeight,
  });

  final Widget title;
  final Widget leading;
  final dynamic bottom;
  final double height;

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
  Size get preferredSize => Size.fromHeight(height);
}
