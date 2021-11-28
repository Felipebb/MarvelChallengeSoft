import 'package:flutter_modular/flutter_modular.dart';

import '../../data/models/character_data_wrapper_model.dart';
import '../repositories/marvel_characters_repository.dart';

abstract class MarvelCharactersUseCase {
  Future<CharacterDataWrapperModel> getMarvelCharacters(int offSet);
}

class MarvelCharactersUseCaseImpl implements MarvelCharactersUseCase {
  final MarvelCharactersRepository marvelCharactersRepository =
      Modular.get<MarvelCharactersRepository>();

  @override
  Future<CharacterDataWrapperModel> getMarvelCharacters(int offSet) async {
    return await marvelCharactersRepository.getMarvelCharacters(offSet);
  }
}
