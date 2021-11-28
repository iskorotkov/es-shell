import 'dart:async';
import 'dart:developer';

import 'package:es_shell/widgets/infer/question.dart';
import 'package:flutter/material.dart';

class OpenQuestion extends Question {
  const OpenQuestion({
    Key? key,
    required Completer<String> completer,
  }) : super(key: key, completer: completer);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
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
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log('confirmed answer ${controller.text}');
                      resolve(controller.text);
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
