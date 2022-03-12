import 'dart:convert';

import 'package:collection/collection.dart';

class Question {

  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correct_answer;
  final List<String> incorrect_answers;
  String? selected;

  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
    this.selected,
  });


  Question copyWith({
    String? category,
    String? type,
    String? difficulty,
    String? question,
    String? correct_answer,
    List<String>? incorrect_answers,
    String? selected,
  }) {
    return Question(
      category: category ?? this.category,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      correct_answer: correct_answer ?? this.correct_answer,
      incorrect_answers: incorrect_answers ?? this.incorrect_answers,
      selected: selected ?? this.selected,
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
      selected: map['selected'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(category: $category, type: $type, difficulty: $difficulty, question: $question, correct_answer: $correct_answer, incorrect_answers: $incorrect_answers, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is Question &&
      other.category == category &&
      other.type == type &&
      other.difficulty == difficulty &&
      other.question == question &&
      other.correct_answer == correct_answer &&
      listEquals(other.incorrect_answers, incorrect_answers) &&
      other.selected == selected;
  }

  @override
  int get hashCode {
    return category.hashCode ^
      type.hashCode ^
      difficulty.hashCode ^
      question.hashCode ^
      correct_answer.hashCode ^
      incorrect_answers.hashCode ^
      selected.hashCode;
  }
}
