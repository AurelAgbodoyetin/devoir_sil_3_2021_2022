import 'package:flutter/material.dart';

import 'package:faucon_qcm/color.dart';

class ScoreScreen extends StatelessWidget {
  final double score;
  final String message;
  final Color textColor;
  const ScoreScreen({
    Key? key,
    required this.score,
    required this.message,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        backgroundColor: backgroundColor.withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: unselectedQuestionColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/congrats.png",
                  scale: 0.7,
                ),
                const Text(
                  "Félicitations !!",
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Score de ${(score * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
