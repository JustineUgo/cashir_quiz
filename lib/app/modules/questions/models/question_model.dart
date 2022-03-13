import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {

  final String category;
  final String type;
  final String difficulty;
  final String question;
  // ignore: non_constant_identifier_names
  final String correct_answer;
  // ignore: non_constant_identifier_names
  final List<String> incorrect_answers;
  String? selected;
  // ignore: non_constant_identifier_names
  String? date_answered;
  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
  // ignore: non_constant_identifier_names
    required this.correct_answer,
  // ignore: non_constant_identifier_names
    required this.incorrect_answers,
    this.selected,
  // ignore: non_constant_identifier_names
    this.date_answered,
  });


  Question copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
  // ignore: non_constant_identifier_names
    String? correct_answer,
  // ignore: non_constant_identifier_names
    List<String>? incorrect_answers,
    String? selected,
  // ignore: non_constant_identifier_names
    String? date_answered,
  }) {
    return Question(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correct_answer: correct_answer ?? this.correct_answer,
      incorrect_answers: incorrect_answers ?? this.incorrect_answers,
      selected: selected ?? this.selected,
      date_answered: date_answered ?? this.date_answered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'difficulty': difficulty,
      'question': question,
      'correct_answer': correct_answer,
      'incorrect_answers': incorrect_answers,
      'selected': selected,
      'date_answered': date_answered,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correct_answer: map['correct_answer'] ?? '',
      incorrect_answers: List<String>.from(map['incorrect_answers']),
      selected: map['selected'],
      date_answered: map['date_answered'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(category: $category, type: $type, difficulty: $difficulty, question: $question, correct_answer: $correct_answer, incorrect_answers: $incorrect_answers, selected: $selected, date_answered: $date_answered)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Question &&
      other.category == category &&
      other.type == type &&
      other.difficulty == difficulty &&
      other.question == question &&
      other.correct_answer == correct_answer &&
      listEquals(other.incorrect_answers, incorrect_answers) &&
      other.selected == selected &&
      other.date_answered == date_answered;
  }

  @override
  int get hashCode {
    return category.hashCode ^
      type.hashCode ^
      difficulty.hashCode ^
      question.hashCode ^
      correct_answer.hashCode ^
      incorrect_answers.hashCode ^
      selected.hashCode ^
      date_answered.hashCode;
  }
}
