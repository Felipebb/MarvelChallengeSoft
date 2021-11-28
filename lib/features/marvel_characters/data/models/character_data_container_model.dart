import 'package:marvel_challenge/features/marvel_characters/domain/entities/character_data_container.dart';

import 'character_model.dart';

class CharacterDataContainerModel extends CharacterDataContainer {
  CharacterDataContainerModel(offset, limit, total, count, results)
      : super(
            offset: offset,
            limit: limit,
            total: total,
            count: count,
            results: results);

  CharacterDataContainerModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(CharacterModel.fromJson(v));
      });
    }
  }
}
