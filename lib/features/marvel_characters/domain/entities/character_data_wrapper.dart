import 'package:marvel_challenge/features/marvel_characters/domain/entities/character_data_container.dart';

class CharacterDataWrapper {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  CharacterDataContainer? data;
  String? etag;

  CharacterDataWrapper(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.data,
      this.etag});
}
