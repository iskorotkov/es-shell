import 'dart:developer';

import 'package:flutter/material.dart';

class OpenQuestion extends StatelessWidget {
  const OpenQuestion({
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
                children: [
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log('clicked button');
                    },
                    child: Text('Confirm'),
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
