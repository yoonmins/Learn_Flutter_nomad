
import 'dart:convert';

import 'package:apptoon/models/webtoon_episode_model.dart';
import 'package:apptoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

import '../models/webtoon_detail_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async{
    List<WebtoonModel> webtoonInstances= [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); //get 요청이후 모든 data를 받아올때까지 기다리기 위해 await 필요 await 는 async 함수가 있어야만 작동가능
    if(response.statusCode ==200){ //code가 200이면 성공적이니 response가 정상적으로 넘어왔는지 확인하는 과정
      final List<dynamic> webtoons = jsonDecode(response.body);
      for( var webtoon in webtoons){
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async{
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if(response.statusCode == 200){
      final webtoon =jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }


  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(String id) async{
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if(response.statusCode == 200){
      final episodes =jsonDecode(response.body);
      for (var episode in episodes){
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
    return episodesInstances;
    }
    throw Error();
  }
}