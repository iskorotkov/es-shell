import 'dart:async';

import 'package:flutter/material.dart';

abstract class Question extends StatelessWidget {
  final Completer<String> completer;

  const Question({
    Key? key,
    required this.completer,
  }) : super(key: key);

  resolve(String value) {
    completer.complete(value);
  }
}
