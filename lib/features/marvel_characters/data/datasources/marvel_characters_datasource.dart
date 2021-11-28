import 'package:dio/dio.dart';

import '../../../../helper.dart';
import '../models/character_data_wrapper_model.dart';

class MarvelCharactersDatasource {
  Helper help = Helper();
  final Dio httpClient = Dio();

  Future<CharacterDataWrapperModel> getMarvelCharacters(int offSet) async {
    var url = help.gerarUrl();
    var response =
        await httpClient.get(url, queryParameters: {"offset": offSet});
    if (response.statusCode == 200) {
      return CharacterDataWrapperModel.fromJson(response.data);
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
