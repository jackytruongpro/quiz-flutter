import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/question_service.dart';
import 'result_screen.dart';
import '../utils/theme.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      List<Question> fetchedQuestions = await QuestionService().getQuestions();
      setState(() {
        questions = fetchedQuestions;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void answerQuestion(int selectedOptionIndex) {
    setState(() {
      if (selectedOptionIndex ==
          questions[currentQuestionIndex].bonneReponse - 1) {
        score++;
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResultScreen(score: score, totalQuestions: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.veryClearGreen,
      appBar: AppBar(
        title: Text("Question ${currentQuestionIndex + 1}"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppTheme.veryClearGreen,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (questions.isEmpty)
                  const CircularProgressIndicator()
                else
                  Column(
                    children: [
                      Text(
                        questions.isNotEmpty
                            ? questions[currentQuestionIndex].intitule
                            : "Pas de questions",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppTheme.darkPrimaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      ...List.generate(
                        questions.isNotEmpty
                            ? questions[currentQuestionIndex].reponses.length
                            : 0,
                        (index) => Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => answerQuestion(index),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                minimumSize: const Size(double.infinity, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                questions[currentQuestionIndex]
                                    .reponses[index]
                                    .intitule,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: AppTheme.darkPrimaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
