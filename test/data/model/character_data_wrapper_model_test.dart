import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/character_data_wrapper_model.dart';

void main() {
  late Map<String, Object> response;
  late CharacterDataWrapperModel characterDataWrapperModel;
  setUp(() async {
    response = {
      "code": 1,
      "status": "A",
      "copyright": "B",
      "attributionText": "C",
      "attributionHTML": "D",
      "data": {
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
      },
      "etag": "E"
    };
  });

  group('CharacterDataWrapperModel Json Parser', () {
    test('[ CharacterDataWrapperModel ] should be parsed', () {
      characterDataWrapperModel = CharacterDataWrapperModel.fromJson(response);
      expect(characterDataWrapperModel, equals(isNotNull));
    });
    test('code should be [1] ', () {
      expect(characterDataWrapperModel.code, 1);
    });
    test('status should be [A] ', () {
      expect(characterDataWrapperModel.status, "A");
    });
    test('copyright should be [B] ', () {
      expect(characterDataWrapperModel.copyright, "B");
    });
    test('attributionText should be [C] ', () {
      expect(characterDataWrapperModel.attributionText, "C");
    });

    test('attributionHTML should be [D] ', () {
      expect(characterDataWrapperModel.attributionHTML, "D");
    });
    test('etag should be [E] ', () {
      expect(characterDataWrapperModel.etag, "E");
    });

    test('data offset should be 12 ', () {
      expect(characterDataWrapperModel.data!.offset, 12);
    });
  });
}
