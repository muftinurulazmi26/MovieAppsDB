import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_apps_trasa/model/movieModel.dart';
import 'package:movie_apps_trasa/models/index.dart';
import 'package:movie_apps_trasa/network/network.dart';

class ServicesMovie{
  static Future<List<Movie>> getNowPlaying () async {
    final response = await http.get(Network.urlNowPlaying);
    final data = jsonDecode(response.body)['results'];
    List<Movie> list =[];

    for (Map i in data) {
      list.add(Movie.fromJson(i));
    }

    return list;
    // print(data);
  }
}