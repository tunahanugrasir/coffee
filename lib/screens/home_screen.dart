import 'package:flutter/material.dart';

import '../core/components/bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final int _seconds = 1;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: _MyAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tabController.animateTo(2, duration: Duration(seconds: _seconds), curve: Curves.fastOutSlowIn);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomAppBar(tabController: _tabController),
      body: MyTabBarViews(tabController: _tabController),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  const _MyAppBar({
    Key? key,
  }) : super(key: key);
  final double _borderRadius = 5;
  final String _assetsProfilePath = 'assets/profile.jpeg';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.widgets_outlined),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: (() {}),
            icon: Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  image: DecorationImage(
                      image: AssetImage(
                        _assetsProfilePath,
                      ),
                      fit: BoxFit.cover)),
            ))
      ],
    );
  }
}
