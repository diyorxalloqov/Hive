import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_project/model/albumModel.dart';
import 'package:hive_project/service/Service.dart';
import 'package:path_provider/path_provider.dart';

class AlbumDBService {
  Box<AlbumModel>? box;
  Service service = Service();

  Future<dynamic> checkAlbum() async {
    await openbox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getAlbum();
    }
  }

  Future<dynamic> getAlbum() async {
    dynamic response = await service.getAlbum();
    if (response is List<AlbumModel>) {
      await openbox();
      await writeToNBU(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  static void registerAdapter() {
    Hive.registerAdapter(AlbumModelAdapter());
  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<AlbumModel>("AlbumDB");
  }

  Future<void> writeToNBU(List<AlbumModel> model) async {
    await openbox();
    await box!.addAll(model);
  }
}
