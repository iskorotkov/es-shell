import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/rule.dart';
import 'custom_card.dart';

class RuleCard extends StatelessWidget {
  final VoidCallback? onTap;

  const RuleCard({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rule = context.watch<Rule>();

    return CustomCard(
      title: rule.name,
      description: rule.description,
      firstColumnChildren: [
        const Text('IF'),
        const SizedBox(height: 4),
        ...rule.conditions
            .map((e) => Text('${e.variable.name} = ${e.value}'))
            .toList(),
      ],
      secondColumnChildren: [
        const Text('THEN'),
        const SizedBox(height: 4),
        ...rule.results
            .map((e) => Text('${e.variable.name} = ${e.value}'))
            .toList(),
      ],
      onTap: onTap,
    );
  }
}
