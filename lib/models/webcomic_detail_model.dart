class WebcomicDetailModel {
  final String title, about, genre, age;

  WebcomicDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
