import 'dart:developer';

import 'package:flutter/material.dart';

import 'question_card.dart';

class OpenQuestionCard extends QuestionCard {
  const OpenQuestionCard({
    Key? key,
    required Question question,
  }) : super(key: key, question: question);

  @override
  State<OpenQuestionCard> createState() => _OpenQuestionCardState();
}

class _OpenQuestionCardState extends State<OpenQuestionCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.question.value ?? '';
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
                      controller: _controller,
                      onChanged: (e) {
                        widget.question.saveAnswer(e);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log('confirmed answer ${_controller.text}');
                      widget.question.confirmAnswer(_controller.text);
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
