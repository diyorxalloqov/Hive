import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/db/AlbumDBService.dart';
import 'package:hive_project/db/NbuDBService.dart';
import 'package:hive_project/db/UserDBService.dart';
import 'package:hive_project/ui/HomePage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  NbuDBService.registerAdapter();
  AlbumDBService.registerAdapter();
  UserDBService.registerAdapter();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
