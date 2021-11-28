import 'dart:async';
import 'dart:developer';

import 'package:es_shell/widgets/infer/question.dart';
import 'package:flutter/material.dart';

class ClosedQuestion extends Question {
  const ClosedQuestion({
    Key? key,
    required Completer<String> completer,
  }) : super(key: key, completer: completer);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text('Вопрос 123'),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: ['1', '2', '3']
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              log('selected option $e');
                              resolve(e);
                            },
                            child: Text(e.toString()),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
