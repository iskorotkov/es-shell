import 'package:flutter/material.dart';

class RuleCard extends StatelessWidget {
  final int index;

  const RuleCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '#${index + 1}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Long description of what this rule does and how it does it',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('IF'),
                  SizedBox(height: 4),
                  Text("var1 = value1"),
                  Text("var1 = value1"),
                  Text("var1 = value1"),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('THEN'),
                  SizedBox(height: 4),
                  Text("var1 = value1"),
                  Text("var1 = value1"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
