import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_project/model/userModel.dart';
import 'package:hive_project/service/Service.dart';
import 'package:path_provider/path_provider.dart';

class UserDBService {
  Box<UserModel>? box;
  Service service = Service();

  Future<dynamic> checkUser() async {
    await openbox();
    if (box!.isNotEmpty) {
      return box!.values.toList();
    } else {
      return getUser();
    }
  }

  Future<dynamic> getUser() async {
    dynamic response = await service.getUser();
    if (response is List<UserModel>) {
      await openbox();
      await writeToUser(response);
      return box!.values.toList();
    } else {
      return response;
    }
  }

  static void registerAdapter() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());

  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox<UserModel>("UserDb");
  }

  Future<void> writeToUser(List<UserModel> model) async {
    await box!.addAll(model);
  }
}
