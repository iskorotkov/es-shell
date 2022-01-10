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
    var values = widget.question.variable.domain!.values;
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(widget.question.variable.questionOrDefault()),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: values.map((e) => _buildValueButton(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueButton(String value) {
    var isFirst = value == widget.question.variable.domain!.values[0];
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: ElevatedButton(
        autofocus: isFirst,
        style: ElevatedButton.styleFrom(
          onSurface: widget.question.value == value ? Colors.green : Colors.red,
        ),
        onPressed: !widget.question.answered
            ? () {
                log('selected option $value');
                widget.question.confirmAnswer(value);
              }
            : null,
        child: Text(value.toString()),
      ),
    );
  }
}
