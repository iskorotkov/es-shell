import 'dart:developer';

import 'package:flutter/material.dart';

class ClosedQuestion extends StatelessWidget {
  const ClosedQuestion({
    Key? key,
  }) : super(key: key);

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
                children: [1, 2, 3]
                    .map((e) => Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              log('clicked $e');
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
