import 'package:marvel_challenge/features/marvel_characters/domain/entities/character.dart';

import 'comic_list_model.dart';
import 'image_model.dart';

class CharacterModel extends Character {
  CharacterModel(id, name, description, modified, thumbnail, comics)
      : super(
            id: id,
            name: name,
            modified: modified,
            description: description,
            thumbnail: thumbnail,
            comics: comics);

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ImageModel.fromJson(json['thumbnail'])
        : null;
    comics =
        json['comics'] != null ? ComicListModel.fromJson(json['comics']) : null;
  }
}
