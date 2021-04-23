import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/survey.dart';

class SurveyProvider with ChangeNotifier {
  Survey _survey;
  int _currentQuestion = 0;
  bool _surveyStarted = false;
  bool _surveyCompleted = false;

  Survey get survey => _survey;
  int get currentQuestion => _currentQuestion;
  bool get surveyStarted => _surveyStarted;
  bool get surveyCompleted => _surveyCompleted;

  Future<void> fetchSurvey() async {
    resetSurvey();
    final url = 'https://dev.news-snap.com/survey/2';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      if (response != null) {
        _survey = Survey.fromJson(extractedData);
      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void startSurvey() {
    _surveyStarted = true;
    notifyListeners();
  }

  void nextQuestion() {
    _currentQuestion += 1;
    if (_currentQuestion >= _survey.fields.length) {
      _surveyCompleted = true;
    }
    notifyListeners();
  }

  void previousQuestion() {
    _currentQuestion -= 1;
    notifyListeners();
  }

  void resetSurvey() {
    _survey = null;
    _currentQuestion = 0;
    _surveyStarted = false;
    _surveyCompleted = false;
  }
}
