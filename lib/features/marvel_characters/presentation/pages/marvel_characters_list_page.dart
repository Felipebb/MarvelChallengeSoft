import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';
import '../../domain/entities/character.dart';
import '../bloc/marvel_characters_bloc.dart';
import 'marvel_characters_detail_page.dart';

class MarvelCharactersListPage extends StatefulWidget {
  const MarvelCharactersListPage({Key? key}) : super(key: key);

  @override
  _MarvelCharactersListPageState createState() =>
      _MarvelCharactersListPageState();
}

class _MarvelCharactersListPageState extends State<MarvelCharactersListPage> {
  MarvelCharactersBloc bloc = MarvelCharactersBloc();
  final _scrollController = ScrollController();
  static const _progressIndicatorSize = 10.0;

  @override
  void initState() {
    super.initState();
    bloc.getMarvelCharactersList();
    _scrollController.addListener(() {
      if (!bloc.isLoadingMoreItems &&
          (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent -
                  _progressIndicatorSize)) {
        bloc.getMarvelCharactersList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: marvelColor,
        toolbarHeight: 100,
        title: const Text("Marvel Challenge"),
        titleTextStyle: GoogleFonts.oswald(
            textStyle: const TextStyle(fontSize: 26), color: Colors.white),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: null,
        stream: bloc.charactersStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _buildListWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "There was an error loading the data.",
              style: GoogleFonts.mcLaren(
                  textStyle: const TextStyle(fontSize: 26),
                  color: Colors.white),
            ));
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        },
      ),
    );
  }

  Widget _buildListWidget(List<Character> characterDataWrapper) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: characterDataWrapper.length + 1,
        controller: _scrollController,
        itemBuilder: (context, position) {
          if (position == characterDataWrapper.length) {
            if (bloc.hasMoreItems) {
              bloc.getMarvelCharactersList();
            }
            return Visibility(
              visible: bloc.hasMoreItems,
              child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator())),
            );
          }
          return _buildCardWidget(characterDataWrapper[position], position);
        });
  }

  Widget _buildCardWidget(Character character, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: InkWell(
        child: Card(
          elevation: 4,
          child: _buildStackWidget(character),
        ),
      ),
    );
  }

  Widget _buildStackWidget(Character character) {
    return Stack(
      children: <Widget>[
        _posterWidget(
            character.thumbnail!.path, character.thumbnail!.extension),
        _titleAndDateWidget(character.name!),
        _viewDetailsWidget(character),
      ],
    );
  }

  Widget _posterWidget(String? imagePath, String? extension) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0), bottomLeft: Radius.circular(4.0)),
        child: Image.network(
          imagePath! + "." + extension!,
          height: 150.0,
          width: 150.0,
          fit: BoxFit.fill,
        ));
  }

  Widget _titleAndDateWidget(String name) {
    return Positioned(
      right: -10,
      top: 20,
      child: SizedBox(
        width: 200,
        child: Text(
          name,
          style: GoogleFonts.mcLaren(
            textStyle: const TextStyle(fontSize: 20),
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  _viewDetailsWidget(Character character) {
    return Positioned(
      bottom: 5,
      right: -45,
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MarvelCharacterDetailPage(
                                character: character,
                              )),
                    );
                  },
                  child: Text(
                    "View details",
                    style: GoogleFonts.mcLaren(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationThickness: 4,
                      ),
                      color: marvelColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
