import 'dart:async';

import 'package:flutter/material.dart';

import '../../model/variable.dart';

class Question {
  final Variable variable;
  final Completer<String> _completer;
  String? value;

  Question({
    required this.variable,
    required Completer<String> completer,
  }) : _completer = completer;

  confirmAnswer(String value) {
    this.value = value;
    _completer.complete(value);
  }

  saveAnswer(String value) {
    this.value = value;
  }
}

abstract class QuestionCard extends StatefulWidget {
  final Question question;

  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);
}
