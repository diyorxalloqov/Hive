import 'package:hive_flutter/adapters.dart';

part 'albumModel.g.dart';

@HiveType(typeId: 1)
class AlbumModel {
  @HiveField(0)
  int? albumId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? thumbnailUrl;

  AlbumModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
