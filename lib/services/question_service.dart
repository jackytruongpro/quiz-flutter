// lib/services/question_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:sqflite/sqflite.dart';
import '../models/question.dart';

class QuestionService {
  Future<List<Question>> getQuestions() async {
    try {
      bool hasNetwork = await _hasNetwork();
      print('Has Network: $hasNetwork');

      List<Question> questions;

      if (hasNetwork) {
        questions = await _getQuestionsFromApi();
        _saveQuestionsToDatabase(questions);
      } else {
        questions = await _getQuestionsFromDatabase();
      }

      return questions;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Question>> _getQuestionsFromApi() async {
    final response = await http.get(
        Uri.parse('https://flutter-learning-iim.web.app/json/questions.json'));
    if (response.statusCode != 200) throw Exception(response.body);

    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> questionsData = jsonData['questions'];

    return questionsData.map((q) => Question.fromJson(q)).toList();
  }

  Future<bool> _hasNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> _saveQuestionsToDatabase(List<Question> questions) async {
    Database database = await openDatabase(
      'questions.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS questions ('
          'id INTEGER PRIMARY KEY,'
          'intitule TEXT,'
          'bonneReponse INTEGER'
          ')',
        );
      },
    );

    await database.delete('questions');

    for (Question question in questions) {
      await database.insert('questions', question.toJson());
    }

    List<Map<String, dynamic>> rows = await database.query('questions');
    print('Database Content: $rows');
  }

  Future<List<Question>> _getQuestionsFromDatabase() async {
    Database database = await openDatabase('questions.db');
    List<Map<String, dynamic>> rows = await database.query('questions');
    return rows.map((row) => Question.fromJson(row)).toList();
  }
}
