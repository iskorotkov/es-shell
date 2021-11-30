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
              child: Text('${widget.question.variable.name}?'),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.question.variable.domain!.values.map((e) {
                  var active =
                      !widget.question.answered || widget.question.value == e;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: ElevatedButton(
                      autofocus:
                          e == widget.question.variable.domain!.values[0],
                      onPressed: active
                          ? () {
                              log('selected option $e');
                              widget.question.confirmAnswer(e);
                            }
                          : null,
                      child: Text(e.toString()),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
