import 'dart:developer';

import 'package:flutter/material.dart';

import 'question_card.dart';

class ClosedQuestionCard extends QuestionCard {
  const ClosedQuestionCard({
    Key? key,
    required Question question,
  }) : super(key: key, question: question);

  @override
  State<ClosedQuestionCard> createState() => _ClosedQuestionCardState();
}

class _ClosedQuestionCardState extends State<ClosedQuestionCard> {
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
                              widget.question.confirmAnswer(e);
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
