import 'package:marvel_challenge/features/marvel_characters/domain/entities/comic_list.dart';

import 'comic_summary_model.dart';

class ComicListModel extends ComicList {
  ComicListModel(
    available,
    returned,
    collectionURI,
    items,
  ) : super(
          available: available,
          returned: returned,
          collectionURI: collectionURI,
          items: items,
        );

  ComicListModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    returned = json['returned'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ComicSummaryModel.fromJson(v));
      });
    }
  }
}
