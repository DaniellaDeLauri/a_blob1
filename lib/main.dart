import 'dart:math';
import 'package:a_blob/resources/styles.dart';
import 'package:a_blob/resources/theme.dart';
import 'package:a_blob/uikit/pages/menuPage.dart';
import 'package:a_blob/uikit/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dataManager.dart';

void main() async{
  await Future.delayed(const Duration(seconds: 1)); //time for splash
  WidgetsFlutterBinding.ensureInitialized(); //change here duration of splash page
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'a_blob',
      theme: usualTheme,
      home: const MenuPage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//   @override
//   initState() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: dark,
//     ));
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: dark,
//         body: Column(
//
//         )
//     );
//   }