import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/character.dart';
import '../../domain/entities/comic_summary.dart';

class MarvelCharacterDetailPage extends StatefulWidget {
  final Character character;
  const MarvelCharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  @override
  _MarvelCharacterDetailPageState createState() =>
      _MarvelCharacterDetailPageState();
}

class _MarvelCharacterDetailPageState extends State<MarvelCharacterDetailPage> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCharacterImageWidget(),
            _buildCharacterNameWidget(),
            _buildCharacterDescriptionWidget(),
            _buildCharacterComicsListWidget(context)
          ],
        ),
      ),
    ));
  }

  ClipPath _buildCharacterImageWidget() {
    var url = widget.character.thumbnail!.path! +
        "." +
        widget.character.thumbnail!.extension!;
    return ClipPath(
      clipper: MyCustomClipper(),
      child: SizedBox(
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Padding _buildCharacterNameWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.character.name!,
        style: GoogleFonts.mcLaren(
            textStyle: const TextStyle(fontSize: 24), color: Colors.red),
      ),
    );
  }

  SizedBox _buildCharacterDescriptionWidget() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.character.description!.isNotEmpty
              ? widget.character.description!
              : "Character description not available",
          style: GoogleFonts.mcLaren(
              textStyle: const TextStyle(fontSize: 16), color: Colors.black),
        ),
      ),
    );
  }

  Column _buildCharacterComicsListWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          "Comics in which it appears",
          style: GoogleFonts.mcLaren(
              textStyle: const TextStyle(fontSize: 24), color: Colors.red),
        ),
        widget.character.comics!.items!.isNotEmpty
            ? MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.character.comics!.items!.length,
                    controller: _scrollController,
                    itemBuilder: (context, position) {
                      return _buildComicsNamesWidget(
                          widget.character.comics!.items![position]);
                    }),
              )
            : Text("Information not available",
                style: GoogleFonts.mcLaren(
                    textStyle: const TextStyle(fontSize: 16),
                    color: Colors.black)),
      ],
    );
  }

  Widget _buildComicsNamesWidget(ComicSummary comicSummary) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        comicSummary.name!,
        style: GoogleFonts.mcLaren(
            textStyle: const TextStyle(fontSize: 12), color: Colors.black),
      ),
    ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    var controllPoint = Offset(60, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
