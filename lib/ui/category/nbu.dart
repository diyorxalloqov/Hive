import 'package:flutter/material.dart';
import 'package:hive_project/db/NbuDBService.dart';
import 'package:hive_project/model/nbuModel.dart';

class Nbu extends StatelessWidget {
  const Nbu({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NbuDBService().checkNbu(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.data is String) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          List<NbuModel> data = snapshot.data as List<NbuModel>;
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].title.toString()),
            );
          },itemCount: data.length,);
        }
      },
    );
  }
}
