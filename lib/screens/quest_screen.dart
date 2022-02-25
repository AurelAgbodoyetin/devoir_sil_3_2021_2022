import 'package:faucon_qcm/brain/compute_score.dart';
import 'package:faucon_qcm/brain/get_score_color.dart';
import 'package:faucon_qcm/brain/get_score_message.dart';
import 'package:faucon_qcm/brain/user_choices.dart';
import 'package:faucon_qcm/data/quizzes_list.dart';
import 'package:faucon_qcm/screens/score_screen.dart';
import 'package:flutter/material.dart';

import 'package:faucon_qcm/color.dart';

class QuestScreen extends StatefulWidget {
  final int currentQuizIndex;
  const QuestScreen({
    Key? key,
    required this.currentQuizIndex,
  }) : super(key: key);

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  final List<String> letters = ['A', 'B', 'C', 'D'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        backgroundColor: backgroundColor.withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            QuestionWidget(
              position: widget.currentQuizIndex + 1,
              question: allQuizzes[widget.currentQuizIndex].question,
            ),
            const SizedBox(height: 20.0),
            Divider(color: unselectedQuestionColor, thickness: 2.0),
            Expanded(
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: allQuizzes[widget.currentQuizIndex]
                      .possibleAnswers
                      .length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 8.0);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: PropositionWidget(
                        proposition: allQuizzes[widget.currentQuizIndex]
                            .possibleAnswers[index],
                        letter: letters[index],
                        isSelected: selectedIndex == index,
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                userChoices.add(selectedIndex);
                if (widget.currentQuizIndex < allQuizzes.length - 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => QuestScreen(
                        currentQuizIndex: widget.currentQuizIndex + 1,
                      ),
                    ),
                  );
                } else {
                  double score = computeUserSuccessRate(userChoices);
                  String message = getScoreMessage(score);
                  Color color = getScoreColor(score);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ScoreScreen(
                        score: score,
                        message: message,
                        textColor: color,
                      ),
                    ),
                  );
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 7.0,
                      ),
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: selectedQuestionColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        "SUIVANT",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final int position;
  final String question;
  const QuestionWidget({
    Key? key,
    required this.position,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      position.toString() + '. ' + question,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      ),
    );
  }
}
//

class PropositionWidget extends StatelessWidget {
  final String proposition;
  final String letter;
  final bool isSelected;

  const PropositionWidget({
    Key? key,
    required this.proposition,
    required this.letter,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: isSelected ? selectedQuestionColor : unselectedQuestionColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.0,
            child: Center(
              child: Text(
                letter,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            backgroundColor: selectedQuestionColor,
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Text(
              proposition,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
