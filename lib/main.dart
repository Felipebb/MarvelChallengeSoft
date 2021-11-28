import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_challenge/features/marvel_characters/presentation/pages/marvel_characters_list_page.dart';

import 'app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MarvelChallengeApp()));
}

class MarvelChallengeApp extends StatelessWidget {
  const MarvelChallengeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MarvelCharactersListPage(),
    );
  }
}
