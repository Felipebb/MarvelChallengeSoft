import 'package:marvel_challenge/features/marvel_characters/data/datasources/marvel_characters_datasource.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/character_data_wrapper_model.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/repositories/marvel_characters_repository.dart';

class MarvelCharactersRepositoryImpl implements MarvelCharactersRepository {
  final MarvelCharactersDatasource marvelCharactersDatasource =
      MarvelCharactersDatasource();
  @override
  Future<CharacterDataWrapperModel> getMarvelCharacters(int offSet) async {
    return await marvelCharactersDatasource.getMarvelCharacters(offSet);
  }
}
