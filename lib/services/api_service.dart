import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webcomic/models/webcomic_detail_model.dart';
import 'package:webcomic/models/webcomic_episode_model.dart';
import 'package:webcomic/models/webcomic_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebComicModel>> getTodaysComics() async {
    List<WebComicModel> webcomicInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webcomics = jsonDecode(response.body);
      for (var webcomic in webcomics) {
        webcomicInstances.add(WebComicModel.fromJson(webcomic));
      }
      return webcomicInstances;
    }
    throw Error();
  }

  static Future<WebcomicDetailModel> getComicById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webcomic = jsonDecode(response.body);
      return WebcomicDetailModel.fromJson(webcomic);
    }
    throw Error();
  }

  static Future<List<WebcomicEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebcomicEpisodeModel> episodesInstance = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstance.add(WebcomicEpisodeModel.froomJson(episode));
      }
      return episodesInstance;
    }
    throw Error();
  }
}
