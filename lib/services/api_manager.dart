// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/model/model.dart';

class ApiManager {
  static Future<List> getJsonData(String url) async {
    try {
      var client = http.Client();
      var responce = await client.get(Uri.parse(url));
      if (responce.statusCode == 200) {
        var jsonData = responce.body;
        var jsonMap = await json.decode(jsonData);

        return jsonMap['results'];
      } else {
        return [];
      }
    } catch (err) {
      return [];
    }
  }

  static getJson(String url) async {
    List<Result> result = [];
    try {
      var client = http.Client();
      var responce = await client.get(Uri.parse(url));
      if (responce.statusCode == 200) {
        var jsonData = responce.body;
        // var jsonMap = await json.decode(jsonData);
        var data = trendingMoviesFromJson(jsonData);
        if (data.results != null) {
          result = data.results!;
        }

        return result;
      } else {
        print("not data");
      }
    } catch (err) {
      print(err);
    }
  }
}
