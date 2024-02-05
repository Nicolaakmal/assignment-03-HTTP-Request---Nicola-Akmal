class ListPostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ListPostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ListPostsModel.fromJson(Map<String, dynamic> json) => ListPostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
