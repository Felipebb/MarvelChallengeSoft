import 'package:marvel_challenge/features/marvel_characters/domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel(path, extension)
      : super(
          path: path,
          extension: extension,
        );

  ImageModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}
