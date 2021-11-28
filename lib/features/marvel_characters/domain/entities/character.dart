import 'package:marvel_challenge/features/marvel_characters/domain/entities/comic_list.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/entities/image.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  Image? thumbnail;
  ComicList? comics;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.comics,
  });
}
