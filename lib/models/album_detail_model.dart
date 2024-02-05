class ListAlbumDetailModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ListAlbumDetailModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory ListAlbumDetailModel.fromJson(Map<String, dynamic> json) =>
      ListAlbumDetailModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
