import 'dart:async';
import 'dart:convert';

import '../models/game_list.dart';

import 'package:http/http.dart' as http;

Future<GameList> fetchGame(String name) async {
  const apiKey = '';
  String gameName = name;

  String url =
      'https://api.thegamesdb.net/v1/Games/ByGameName?apikey=$apiKey&name=$gameName';

  final response = await http.get(
    Uri.parse(url),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    GameList fetchedData = GameList.fromJson(
        jsonDecode(response.body)['data'] as Map<String, dynamic>);

    return fetchedData;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to find games');
  }
}
