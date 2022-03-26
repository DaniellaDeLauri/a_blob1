import 'dart:math';

import 'package:blob/styles.dart';
import 'package:blob/widgets.dart';
import 'package:blob/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blob',
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText2: TextStyle(
        fontFamily: 'adys',
      ))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late double _scrollPosition = 0;
  List<Task> tasks = [
    Task(name: 'Анаграммы', maxResult: 6, userResult: 7),
    Task(name: 'Синонимы', maxResult: 0, userResult: 7),
    Task(name: 'Состав числа', maxResult: 6, userResult: 7),
    Task(name: 'Антонимы', maxResult: 7, userResult: 7),
    Task(name: 'Лишнее слово', maxResult: 5, userResult: 7),
    Task(name: 'Слово по формуле', maxResult: 3, userResult: 7),
  ];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: dark, // status bar color
    ));
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: dark,
        body: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          itemCount: tasks.length + 1,
          itemBuilder: (_, i) {
            if (i == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      Text(
                        'Упражнения',
                        style: TextStyle(
                            color: const Color(0xffffffff).withOpacity(
                                min(max(1 - _scrollPosition / 30, 0), 1)),
                            fontSize: 37 - max(_scrollPosition / 4, -10),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  )
                ],
              );
            }
            return TaskCard(task: tasks[i - 1]);
          },
        ));
  }
}
