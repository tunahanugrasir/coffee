import 'package:coffe/product/colors/product_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _title = 'Coffy';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: MyColors.ruinedSmores),
          scaffoldBackgroundColor: MyColors.ruinedSmores,
          appBarTheme: const AppBarTheme(backgroundColor: MyColors.ruinedSmores),
          tabBarTheme: const TabBarTheme(
              labelColor: MyColors.mapleLeaf,
              unselectedLabelColor: Colors.white,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                color: MyColors.mapleLeaf,
              ))),
          bottomAppBarColor: MyColors.ruinedSmores,
          textTheme: const TextTheme(
              headline3: TextStyle(color: Colors.white), subtitle2: TextStyle(color: MyColors.mapleLeaf))),
      home: const HomeScreen(),
    );
  }
}
