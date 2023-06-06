import 'package:dio/dio.dart';
import 'package:hive_project/model/albumModel.dart';
import 'package:hive_project/model/nbuModel.dart';
import 'package:hive_project/model/userModel.dart';

class Service {
  Future<dynamic> getNbu() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => NbuModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> getUser() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> getAlbum() async {
    try {
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/albums");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => AlbumModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
