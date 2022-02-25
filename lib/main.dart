import 'package:faucon_qcm/color.dart';
import 'package:faucon_qcm/data/quizzes_list.dart';
import 'package:faucon_qcm/screens/quest_screen.dart';
import 'package:faucon_qcm/screens/score_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quizz',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Muli',
        primarySwatch: Colors.blue,
      ),
      // home: QuestScreen(quiz: allQuizzes[2]),
      home: const QuestScreen(currentQuizIndex: 0),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Let's code the Flutter Quizz App"),
      ),
    );
  }
}
