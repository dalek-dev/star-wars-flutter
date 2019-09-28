import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba/models/model_starwars.dart';

class StarWarsProvider {

  static Future<StarWars> peopleStarWars() async{
    const _url = 'https://swapi.co/api';
    final url   = '$_url/people/';

    final resp        = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    final Map<String, dynamic> decodeData  =  json.decode(resp.body);
    return StarWars.fromJson(decodeData);
  }

}
