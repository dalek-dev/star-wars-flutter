class StarWars {
  final int count;
  final String next;
  final int previous;
  final List<StarWarsModel> results;

  StarWars({this.count, this.next, this.previous, this.results});

  factory StarWars.fromJson(Map<String, dynamic> json) {
    return new StarWars(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((e) => StarWarsModel.fromJson(e))
          .toList(),
    );
  }
}

class StarWarsModel{
  String name;
  String height;
  String mass;
  String hair_color;
  String skin_color;
  String eye_color;
  String birth_year;
  String gender;
  String male;
  String homeworld;
  List<String> films;
  List<String> species;
  List<String> vehicles;
  List<String> starships;
  String created;
  String edited;
  String url;

  StarWarsModel({
    this.name,
    this.height,
    this.mass,
    this.hair_color,
    this.skin_color,
    this.eye_color,
    this.birth_year,
    this.gender,
    this.male,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });


  factory StarWarsModel.fromJson(Map<String, dynamic> json) => new StarWarsModel(
    name        : json['name'],
    height      : json['height'],
    mass        : json['mass'],
    hair_color  : json['hair_color'],
    skin_color  : json['skin_color'],
    eye_color   : json['eye_color'],
    birth_year  : json['birth_year'],
    gender      : json['gender'],
    male        : json['male'],
    homeworld   : json['homeworld'],
    films       : (json['films'] as List).cast<String>().toList(),
    species     : (json['species'] as List).cast<String>().toList(),
    vehicles    : (json['vehicles'] as List).cast<String>().toList(),
    starships   : (json['starships'] as List).cast<String>().toList(),
    created     : json['created'],
    edited      : json['edited'],
    url         : json['url']
  );
}