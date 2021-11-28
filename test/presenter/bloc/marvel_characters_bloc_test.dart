import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/app_module.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/character_data_wrapper_model.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/entities/character_data_container.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/usecases/marvel_characters_use_case.dart';
import 'package:marvel_challenge/features/marvel_characters/presentation/bloc/marvel_characters_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class MockUsecase extends Mock implements MarvelCharactersUseCase {}

void main() async {
  late MarvelCharactersUseCase mockUsecase;
  late MarvelCharactersBloc bloc;
  CharacterDataWrapperModel response = CharacterDataWrapperModel(
      null,
      null,
      null,
      null,
      null,
      CharacterDataContainer(
          count: null, limit: null, offset: null, results: [], total: null),
      null);

  setUp(() {
    initModule(
      AppModule(),
      replaceBinds: [Bind<MarvelCharactersUseCase>((i) => MockUsecase())],
    );
    mockUsecase = Modular.get<MarvelCharactersUseCase>();
    bloc = MarvelCharactersBloc();
  });

  group('MarvelCharactersBloc tests', () {
    test('getMarvelCharactersList testing', () async {
      when(() => mockUsecase.getMarvelCharacters(any()))
          .thenAnswer((_) async => response);
      bloc.getMarvelCharactersList();

      expect(bloc.auxResponse, isA<CharacterDataWrapperModel>());
      expect(bloc.hasMoreItems, isA<bool>());
      expect(true, bloc.hasMoreItems);
      expect(bloc.isLoadingMoreItems, isA<bool>());
      expect(true, bloc.isLoadingMoreItems);
      expect(bloc.offSet, isA<int>());
      expect(0, bloc.offSet);
    });
  });
}
