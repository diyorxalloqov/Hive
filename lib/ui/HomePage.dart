import 'package:flutter/material.dart';
import 'package:hive_project/ui/category/album.dart';
import 'package:hive_project/ui/category/nbu.dart';
import 'package:hive_project/ui/category/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading"),
        bottom: TabBar(controller: tabController, tabs: const [
          Tab(
            text: 'nbu',
          ),
          Tab(
            text: 'album',
          ),
          Tab(
            text: 'user',
          ),
        ]),
      ),
      body: TabBarView(controller: tabController, children: _category),
    );
  }

  final List<Widget> _category = const [
    Nbu(),
    Album(),
    User(),
  ];
}
