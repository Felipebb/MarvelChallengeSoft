import 'package:marvel_challenge/features/marvel_characters/domain/entities/comic_summary.dart';

class ComicSummaryModel extends ComicSummary {
  ComicSummaryModel(
    resourceURI,
    name,
  ) : super(
          resourceURI: resourceURI,
          name: name,
        );

  ComicSummaryModel.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }
}
