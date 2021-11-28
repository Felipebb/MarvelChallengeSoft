import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/character_data_container_model.dart';

void main() {
  late Map<String, Object> response;
  late CharacterDataContainerModel characterDataContainerModel;
  setUp(() async {
    response = {
      "offset": 12,
      "limit": 123,
      "total": 1234,
      "count": 12345,
      "results": [
        {
          "id": 580489,
          "name": "string",
          "description": "string",
          "modified": "Date",
          "thumbnail": {"path": "string", "extension": "string"},
          "comics": {
            "available": 123456,
            "returned": 1234567,
            "collectionURI": "string",
            "items": [
              {"resourceURI": "string", "name": "string"}
            ]
          },
        }
      ]
    };
  });

  group('CharacterDataContainerModel Json Parser', () {
    test('[ CharacterDataContainerModel ] should be parsed', () {
      characterDataContainerModel =
          CharacterDataContainerModel.fromJson(response);
      expect(characterDataContainerModel, equals(isNotNull));
    });

    test('offset should be [12] ', () {
      expect(characterDataContainerModel.offset, 12);
    });
    test('limit should be [123] ', () {
      expect(characterDataContainerModel.limit, 123);
    });

    test('total should be [1234] ', () {
      expect(characterDataContainerModel.total, 1234);
    });
    test('count should be [12345] ', () {
      expect(characterDataContainerModel.count, 12345);
    });

    test('results size should be 1 ', () {
      expect(characterDataContainerModel.results!.length, 1);
    });

    test('results id should be [580489] ', () {
      expect(characterDataContainerModel.results!.elementAt(0).id, 580489);
    });
  });
}
