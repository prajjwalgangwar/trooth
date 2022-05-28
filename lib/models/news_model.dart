import 'dart:convert';

// News newsFromJson(String str) => News.fromJson(json.decode(str));

// String newsToJson(News data) => json.encode(data.toJson());

class News {
  final title;
  final content;
  final id;
  final rank;

  News(
      {required this.rank,
      required this.title,
      required this.content,
      required this.id});

  static News newsfromJson(json) {
    return News(
        title: json['title'],
        content: json['content'],
        id: json['id'],
        rank: json['rank']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'id': id, 'content': content, 'rank': rank};
  }
}
