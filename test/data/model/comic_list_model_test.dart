import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/comic_list_model.dart';

void main() {
  late Map<String, Object> response;
  late ComicListModel comicListModel;

  setUp(() async {
    response = {
      "available": 123456,
      "returned": 1234567,
      "collectionURI": "URI",
      "items": [
        {"resourceURI": "URI", "name": "string"}
      ]
    };
  });

  group('ComicListModel Json Parser', () {
    test('[ ComicListModel ] should be parsed', () {
      comicListModel = ComicListModel.fromJson(response);
      expect(comicListModel, equals(isNotNull));
    });
    test('available should be [123456] ', () {
      expect(comicListModel.available, 123456);
    });

    test('returned should be [1234567] ', () {
      expect(comicListModel.returned, 1234567);
    });

    test('collectionURI should be [URI] ', () {
      expect(comicListModel.collectionURI, "URI");
    });

    test('items size should be 1 ', () {
      expect(comicListModel.items!.length, 1);
    });

    test('items resourceURI should be [URI] ', () {
      expect(comicListModel.items!.elementAt(0).resourceURI, "URI");
    });
  });
}
