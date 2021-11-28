import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_challenge/features/marvel_characters/data/datasources/marvel_characters_datasource.dart';
import 'package:marvel_challenge/features/marvel_characters/data/repositories/marvel_characters_repository_impl.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/repositories/marvel_characters_repository.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/usecases/marvel_characters_use_case.dart';

import 'features/marvel_characters_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<MarvelCharactersUseCase>((i) => MarvelCharactersUseCaseImpl()),
    Bind<MarvelCharactersRepository>((i) => MarvelCharactersRepositoryImpl()),
    Bind<MarvelCharactersDatasource>((i) => MarvelCharactersDatasource()),
  ];

  final List<ModularRoute> modularRouters = <ModularRoute>[];

  AppModule() {
    modularRouters.addAll([
      ModuleRoute(
        Modular.initialRoute,
        module: MarvelCharactersModule(),
        transition: TransitionType.noTransition,
      ),
    ]);
  }
}
