import 'package:flutter/material.dart';

import 'package:faucon_qcm/color.dart';
import 'package:faucon_qcm/models/question.dart';

class QuestScreen extends StatelessWidget {
  final Quiz quiz;
  const QuestScreen({
    Key? key,
    required this.quiz,
  }) : super(key: key);

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
            QuestionWidget(position: 1, question: quiz.question),
            const SizedBox(height: 20.0),
            Divider(color: unselectedQuestionColor, thickness: 2.0),
            PropositionsWidget(
              props: quiz.possibleAnswers,
            ),
            GestureDetector(
              onTap: () {},
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
    return Text.rich(
      TextSpan(
          text: position.toString() + '. ',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
          children: [
            TextSpan(
              text: question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ]),
    );
  }
}

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
        //color: unselectedQuestionColor,
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
          Text(
            proposition,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class PropositionsWidget extends StatefulWidget {
  final List<String> props;
  const PropositionsWidget({
    Key? key,
    required this.props,
  }) : super(key: key);

  @override
  State<PropositionsWidget> createState() => _PropositionsWidgetState();
}

class _PropositionsWidgetState extends State<PropositionsWidget> {
  final List<String> letters = ['A', 'B', 'C', 'D'];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.props.length,
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
                proposition: widget.props[index],
                letter: letters[index],
                isSelected: selectedIndex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
