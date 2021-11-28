import 'package:marvel_challenge/features/marvel_characters/data/models/character_data_container_model.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/entities/character_data_container.dart';
import 'package:marvel_challenge/features/marvel_characters/domain/entities/character_data_wrapper.dart';

class CharacterDataWrapperModel extends CharacterDataWrapper {
  CharacterDataWrapperModel(
    int? code,
    String? status,
    String? copyright,
    String? attributionHTML,
    String? attributionText,
    CharacterDataContainer? data,
    String? etag,
  ) : super(
            code: code,
            status: status,
            copyright: copyright,
            attributionText: attributionText,
            attributionHTML: attributionHTML,
            data: data);

  CharacterDataWrapperModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    data = json['data'] != null
        ? CharacterDataContainerModel.fromJson(json['data'])
        : null;
    etag = json['etag'];
  }
}
