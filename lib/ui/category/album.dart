import 'package:flutter/material.dart';
import 'package:hive_project/db/AlbumDBService.dart';
import 'package:hive_project/model/albumModel.dart';

class Album extends StatelessWidget {
  const Album({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: AlbumDBService().getAlbum,
      child: FutureBuilder(
        future: AlbumDBService().checkAlbum(),
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
            List<AlbumModel> data = snapshot.data as List<AlbumModel>;
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title.toString()),
              );
            },itemCount: data.length,);
          }
        },
      ),
    );
  }
}
