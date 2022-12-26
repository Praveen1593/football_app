// To parse this JSON data, do
//
//     final players = playersFromJson(jsonString);

import 'dart:convert';

List<Players> playersFromJson(String str) => List<Players>.from(json.decode(str).map((x) => Players.fromJson(x)));

String playersToJson(List<Players> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Players {
  Players({
    this.player,
    this.statistics,
  });

  Player player;
  List<Statistic> statistics;

  factory Players.fromJson(Map<String, dynamic> json) => Players(
    player: Player.fromJson(json["player"]),
    statistics: List<Statistic>.from(json["statistics"].map((x) => Statistic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "player": player.toJson(),
    "statistics": List<dynamic>.from(statistics.map((x) => x.toJson())),
  };
}

class Player {
  Player({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  String nationality;
  String height;
  String weight;
  bool injured;
  String photo;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json["id"],
    name: json["name"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    age: json["age"],
    nationality: json["nationality"],
    height: json["height"],
    weight: json["weight"],
    injured: json["injured"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "firstname": firstname,
    "lastname": lastname,
    "age": age,
    "nationality": nationality,
    "height": height,
    "weight": weight,
    "injured": injured,
    "photo": photo,
  };
}

class Statistic {
  Statistic({
    this.team,
    this.league,
    this.cards,
  });

  Team team;
  League league;
  Cards cards;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    team: Team.fromJson(json["team"]),
    league: League.fromJson(json["league"]),
    cards: Cards.fromJson(json["cards"]),
  );

  Map<String, dynamic> toJson() => {
    "team": team.toJson(),
    "league": league.toJson(),
    "cards": cards.toJson(),
  };
}

class Cards {
  Cards({
    this.yellow,
    this.yellowred,
    this.red,
  });

  int yellow;
  int yellowred;
  int red;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
    yellow: json["yellow"],
    yellowred: json["yellowred"],
    red: json["red"],
  );

  Map<String, dynamic> toJson() => {
    "yellow": yellow,
    "yellowred": yellowred,
    "red": red,
  };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag,
    "season": season,
  };
}

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}
