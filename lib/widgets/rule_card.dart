import 'package:flutter/material.dart';

import 'custom_card.dart';

class RuleCard extends StatelessWidget {
  final int index;

  const RuleCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      index: index,
      title: 'Some rule',
      description: 'Long description of what this rule does and how it does it',
      firstColumnChildren: const [
        Text('IF'),
        SizedBox(height: 4),
        Text("var1 = value1"),
        Text("var1 = value1"),
        Text("var1 = value1"),
      ],
      secondColumnChildren: const [
        Text('THEN'),
        SizedBox(height: 4),
        Text("var1 = value1"),
        Text("var1 = value1"),
      ],
    );
  }
}
