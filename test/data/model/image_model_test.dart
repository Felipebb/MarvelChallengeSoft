import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_challenge/features/marvel_characters/data/models/image_model.dart';

void main() {
  late Map<String, Object> response;
  late ImageModel imageModel;

  setUp(() async {
    response = {"path": "http://asd", "extension": "jpg"};
  });

  group('ImageModel Json Parser', () {
    test('[ ImageModel ] should be parsed', () {
      imageModel = ImageModel.fromJson(response);
      expect(imageModel, equals(isNotNull));
    });
    test('path should be [http://asd] ', () {
      expect(imageModel.path, "http://asd");
    });
    test('extension should be [jpg] ', () {
      expect(imageModel.extension, "jpg");
    });
  });
}
