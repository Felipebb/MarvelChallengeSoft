import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/comic_summary_model.dart';

void main() {
  late Map<String, Object> response;
  late ComicSummaryModel comicSummaryModel;

  setUp(() async {
    response = {"resourceURI": "URI", "name": "name"};
  });

  group('ComicSummaryModel Json Parser', () {
    test('[ ComicSummaryModel ] should be parsed', () {
      comicSummaryModel = ComicSummaryModel.fromJson(response);
      expect(comicSummaryModel, equals(isNotNull));
    });
    test('resourceURI should be [URI] ', () {
      expect(comicSummaryModel.resourceURI, "URI");
    });
    test('name should be [name] ', () {
      expect(comicSummaryModel.name, "name");
    });
  });
}
