import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/album_detail_model.dart';
import '../models/post_model.dart';
import '../models/profile_model.dart';
import '../models/album_model.dart';




Future<List<ListPostsModel>> getPostsData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListPostsModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListProfileModel>> getProfileData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListProfileModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListAlbumModel>> getAlbumData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    //print(list);
    return list.map((index) => ListAlbumModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}

Future<List<ListAlbumDetailModel>> getAlbumDetail(int index) async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$index/photos'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    return list.map((index) => ListAlbumDetailModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load album');
  }
}
