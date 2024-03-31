import 'package:flutter/material.dart';

import 'modules/login/presenter/pages/login_page.dart';

class AppTmdb extends StatelessWidget {
  const AppTmdb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
