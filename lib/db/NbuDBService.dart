import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_project/model/nbuModel.dart';
import 'package:hive_project/service/Service.dart';
import 'package:path_provider/path_provider.dart';

class NbuDBService {
  Box<NbuModel>? box;
  Service service = Service();

  Future<dynamic> checkNbu() async {
    await openbox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getNbu();
    }
  }

  Future<dynamic> getNbu() async {
    dynamic response = await service.getNbu();
    if (response is List<NbuModel>) {
      await openbox();
      await writeToNBU(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  static void registerAdapter() {
    Hive.registerAdapter(NbuModelAdapter());
  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<NbuModel>("NbuDB");
  }

  Future<void> writeToNBU(List<NbuModel> model) async {
    await box!.addAll(model);
  }
}
