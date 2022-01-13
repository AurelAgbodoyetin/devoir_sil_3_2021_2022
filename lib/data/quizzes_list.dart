import 'package:faucon_qcm/models/question.dart';

final List<Quiz> allQuizzes = [
  Quiz(
    question: "Qu'est - ce que Flutter ?",
    possibleAnswers: [
      'Un SDK permettant de développer des applications crossplatform',
      'Un package permettant de développer des applications crossplatform',
      'Un framework permettant de développer des applications crossplatform',
      'Rien de tout ça'
    ],
    correctAnswerIndex: 0,
  ),
  Quiz(
    question: 'Quelle entreprise a développé Flutter ?',
    possibleAnswers: ['Google', 'Amazon', 'Facebook', 'Apple'],
    correctAnswerIndex: 0,
  ),
  Quiz(
    question: 'En quelle année Flutter a t -il été développé ?',
    possibleAnswers: ['2012', '2015', '2017', '2018'],
    correctAnswerIndex: 2,
  ),
  Quiz(
    question: 'Sur quel langage Flutter est-il basé ?',
    possibleAnswers: ['GoLang', 'Rust', 'PHP', 'Dart'],
    correctAnswerIndex: 3,
  ),
  Quiz(
    question: 'En Flutter, tout est ...',
    possibleAnswers: ['Stateless', 'Objet', 'Widget', 'Column'],
    correctAnswerIndex: 2,
  ),
  Quiz(
    question: 'En Flutter, les widgets sont divisés en ...',
    possibleAnswers: [
      '2 grandes catégories',
      '4 grandes catégories',
      '3 grandes catégories',
      'Pas de classification'
    ],
    correctAnswerIndex: 0,
  ),
];
