class ListAlbumModel {
  int? userId;
  int? id;
  String? title;

  ListAlbumModel({
    this.userId,
    this.id,
    this.title,
  });

  factory ListAlbumModel.fromJson(Map<String, dynamic> json) => ListAlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
