import 'package:marvel_challenge/features/marvel_characters/domain/entities/character.dart';

class CharacterDataContainer {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Character>? results;

  CharacterDataContainer({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });
}
