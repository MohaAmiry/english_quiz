import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Models/QuizModel.dart';
import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/UserModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:flutter/widgets.dart';

import '../../../Models/AnswerModel.dart';
import '../../../Models/QuestionModel.dart';

class StudentHomeViewModel extends ChangeNotifier{
  Repository myRepo = Repository();

  UserModel student = UserModel(id: Guid("temp"), role: Roles.student,
      firstName: "first", lastName: "last", email: "Test@Test.com", isExist: true);
  final List<QuizModel> _quizzes = [
    for(var i = 0; i <10; i++)
      QuizModel(
          id: Guid("${i}"),
          creationTime: "now",
          questions: [
            QuestionModel(id: Guid("1"), qText: "${i} first Q", answers: [
              Answer(id: Guid("1"), aText: "First 1", isCorrect: true, isSelected: false),
              Answer(id: Guid("2"), aText: "First 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "First 3", isCorrect: false, isSelected: false),
              Answer(id: Guid("4"), aText: "First 4", isCorrect: false, isSelected: false),
            ]),
            QuestionModel(id: Guid("2"), qText: "Second Q", answers: [
              Answer(id: Guid("1"), aText: "Second 1", isCorrect: false, isSelected: false),
              Answer(id: Guid("2"), aText: "Second 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "Second 3", isCorrect: true, isSelected: false),
              Answer(id: Guid("4"), aText: "Second 4", isCorrect: false, isSelected: false),
            ]),
            QuestionModel(id: Guid("3"), qText: "Third Q", answers: [
              Answer(id: Guid("1"), aText: "Third 1", isCorrect: false, isSelected: false),
              Answer(id: Guid("2"), aText: "Third 2", isCorrect: false, isSelected: true),
              Answer(id: Guid("3"), aText: "Third 3", isCorrect: false, isSelected: false),
              Answer(id: Guid("4"), aText: "Third 4", isCorrect: true, isSelected: false),
            ])],
          duration: 20,expiryDate: "test",requiredStudents: [],testedStudents: [])
  ];

  int get quizNumber => _quizzes.length;

  int getQuizDuration(int index) => _quizzes[index].duration;

  int getQuizQNumber(int index) => _quizzes[index].questions.length;

  QuizModel getQuizToSave(int index) => _quizzes[index];




  String studentLevel = "A1";

  String getWelcome() => "Welcome ${student.firstName} ${student.lastName}!";

  String getLevel() => studentLevel;


  void getAllStudentQuizzes() async{
    myRepo.getAllStudentQuizzes();



  }


  void saveQuizInfoLocally(QuizModel quizModel){
    LocalQuizModel x = LocalQuizModel(model: quizModel);
  }




}