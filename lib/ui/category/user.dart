import 'package:flutter/material.dart';
import 'package:hive_project/db/UserDBService.dart';
import 'package:hive_project/model/userModel.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDBService().checkUser(),
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
          List<UserModel> data = snapshot.data as List<UserModel>;
          return ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].name.toString()),
            );
          },itemCount: data.length,);
        }
      },
    );
  }
}
