import 'package:flutter/material.dart';
import 'widgets/question_screen.dart';
import 'utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo/logo.png',
                      width: MediaQuery.of(context).size.width * 0.35,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        minimumSize: const Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        'Commencer le quiz',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppTheme.darkPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Quiz par Jacky TRUONG',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
