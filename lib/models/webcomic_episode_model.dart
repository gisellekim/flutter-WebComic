class WebcomicEpisodeModel {
  final String id, title, rating, date;

  WebcomicEpisodeModel.froomJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
