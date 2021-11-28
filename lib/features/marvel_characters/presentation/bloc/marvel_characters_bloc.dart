import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../data/models/character_data_wrapper_model.dart';
import '../../domain/entities/character_data_container.dart';
import '../../domain/entities/character_data_wrapper.dart';
import '../../domain/usecases/marvel_characters_use_case.dart';

class MarvelCharactersBloc {
  MarvelCharactersUseCase marvelCharactersUseCase =
      Modular.get<MarvelCharactersUseCase>();

  bool isLoadingMoreItems = false;
  bool hasMoreItems = true;
  int offSet = 0;

  final subject = StreamController();
  Stream get charactersStream => subject.stream;

  //!Lista auxiliar para ajudar com paginação infinita
  CharacterDataWrapperModel auxResponse = CharacterDataWrapperModel(
      null,
      null,
      null,
      null,
      null,
      CharacterDataContainer(
          count: null, limit: null, offset: null, results: [], total: null),
      null);

  getMarvelCharactersList() async {
    if (!isLoadingMoreItems) {
      isLoadingMoreItems = true;
      try {
        CharacterDataWrapper response =
            await marvelCharactersUseCase.getMarvelCharacters(offSet);
        hasMoreItems = auxResponse.data!.results!.isNotEmpty;
        auxResponse.data!.results!.addAll(response.data!.results!);
        offSet = offSet + 20;
        subject.sink.add(auxResponse.data!.results);
      } on Exception {
        subject.sink.addError(500);
      }
      isLoadingMoreItems = false;
    }
  }

  void dispose() {
    subject.close();
  }
}
