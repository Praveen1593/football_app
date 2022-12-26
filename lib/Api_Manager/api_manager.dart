import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../Models/playersmodel.dart';
import '../Models/soccermodel.dart';


class SoccerApi {
  //now let's set our variables
  //first : let's add the endpoint URL
  // we will get all the data from api-sport.io
  // we will just change our endpoint
  //the null means that the match didn't started yet
  //let's fix that
  String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2021&league=39";
 // "https://v3.football.api-sports.io/fixtures?live=all";
  String playerUrl = "https://v3.football.api-sports.io/players?league=39&season=2021";
  //In our tutorial we will only see how to get the live matches
  //make sure to read the api documentation to be ables too understand it

  // you will find your api key in your dashboard
  //so create your account it's free
  //Now let's add the headers
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "f3af95b3a35138f536572aa2c4b53fbf"
  };

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }

  }
  Future<List<Players>> getPlayers() async {
    Response res = await get(Uri.parse(playerUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> playersList = body['response'];
      print("Api service: ${body}"); // to debug
      List<Players> player = playersList
          .map((dynamic item) => Players.fromJson(item))
          .toList();

     return player;
    }

  }
}