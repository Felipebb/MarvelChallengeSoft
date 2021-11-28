import 'package:flutter_modular/flutter_modular.dart';

import 'marvel_characters/data/repositories/marvel_characters_repository_impl.dart';
import 'marvel_characters/domain/repositories/marvel_characters_repository.dart';
import 'marvel_characters/domain/usecases/marvel_characters_use_case.dart';

class MarvelCharactersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<MarvelCharactersUseCase>((i) => MarvelCharactersUseCaseImpl()),
    Bind<MarvelCharactersRepository>((i) => MarvelCharactersRepositoryImpl()),
  ];
}
