import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:prueba/models/model_starwars.dart';

const _url = 'https://swapi.co/api';

class StarWarsProvider implements StarWarsRepository{

  Future<StarWars> fetchStarWars(int pageNumbers) async{
    final url   = '$_url/people/';
    final resp  =  await http.get(url +
        "?page=" +
        pageNumbers.toString());
    return compute(parseStarWars, resp.body);
  }

}

StarWars parseStarWars(String responseBody) {
  final Map starWarsMap = JsonCodec().decode(responseBody);
  print(starWarsMap);
  StarWars starwar = StarWars.fromMap(starWarsMap);
  if (starwar == null) {
    throw new FetchStarWarsException("An error occurred : [ Status Code = ]");
  }
  return starwar;
}



