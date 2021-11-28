import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/character_model.dart';

void main() {
  late Map<String, Object> response;
  late CharacterModel characterModel;
  setUp(() async {
    response = {
      "id": 580489,
      "name": "name",
      "description": "description",
      "modified": "modified",
      "thumbnail": {"path": "string", "extension": "jpg"},
      "comics": {
        "available": 123456,
        "returned": 1234567,
        "collectionURI": "string",
        "items": [
          {"resourceURI": "string", "name": "string"}
        ]
      },
    };
  });

  group('CharacterModel Json Parser', () {
    test('[ CharacterModel ] should be parsed', () {
      characterModel = CharacterModel.fromJson(response);
      expect(characterModel, equals(isNotNull));
    });
    test('id should be [580489] ', () {
      expect(characterModel.id, 580489);
    });
    test('name should be [name] ', () {
      expect(characterModel.name, "name");
    });
    test('description should be [1] ', () {
      expect(characterModel.description, "description");
    });
    test('modified should be [1] ', () {
      expect(characterModel.modified, "modified");
    });
    test('thumbnail should be [jpg] ', () {
      expect(characterModel.thumbnail!.extension, "jpg");
    });

    test('comics should be [1] ', () {
      expect(characterModel.comics!.available, 123456);
    });
  });
}
