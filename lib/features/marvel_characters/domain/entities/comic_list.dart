import 'comic_summary.dart';

class ComicList {
  int? available;
  int? returned;
  String? collectionURI;
  List<ComicSummary>? items;

  ComicList({
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  });
}
