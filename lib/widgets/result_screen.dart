import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:confetti/confetti.dart';
import 'question_screen.dart';
import '../utils/theme.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    if ((widget.score / widget.totalQuestions) == 1.0) {
      _controllerCenter.play();
    }
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (widget.score / widget.totalQuestions) * 100;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppTheme.veryClearGreen,
      appBar: AppBar(
        title: const Text("Résultat"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (percentage == 100)
              Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: true,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple
                  ],
                ),
              ),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 15.0,
              animation: true,
              animationDuration: 1200,
              percent: percentage / 100,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${percentage.toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.darkPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Score : ${widget.score} / ${widget.totalQuestions}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: AppTheme.lightGrayColor,
              linearGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.primaryColor, AppTheme.darkPrimaryColor],
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                backgroundColor: AppTheme.darkPrimaryColor,
                minimumSize: const Size(double.infinity, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                percentage == 100
                    ? 'Recommencer le quiz'
                    : 'Je retente ma chance',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: AppTheme.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
