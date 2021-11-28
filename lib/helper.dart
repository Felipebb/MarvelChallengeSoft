import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:marvel_challenge/constants.dart';

class Helper {
  var timeStamp = DateTime.now();
  var hash;

  String gerarUrl() {
    gerarHash();
    String urlFinal =
        "$baseUrl?ts=${timeStamp.toIso8601String()}&apikey=$publicApiKey&hash=$hash";
    return urlFinal;
  }

  gerarHash() {
    hash =
        generateMd5(timeStamp.toIso8601String() + privateApiKey + publicApiKey);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
