import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
