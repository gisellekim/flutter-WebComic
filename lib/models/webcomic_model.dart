class WebComicModel {
  final String title, thumb, id;

  WebComicModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
