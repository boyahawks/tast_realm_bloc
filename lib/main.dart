import 'package:ehp/initialize.dart';
import 'package:ehp/v2/components/home/home_view.dart';
import 'package:ehp/v2/helper/utils/colors.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMS Mobile',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: primaryColor,
          elevation: 0,
        ),
      ),
      home: const HomeView(),
    );
  }
}
