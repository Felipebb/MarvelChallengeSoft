import '../../data/models/character_data_wrapper_model.dart';

abstract class MarvelCharactersRepository {
  Future<CharacterDataWrapperModel> getMarvelCharacters(int offSet);
}
