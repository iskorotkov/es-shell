import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/rule.dart';
import '../common/custom_card.dart';

class RuleCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool selected;

  const RuleCard({Key? key, this.onTap, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rule = context.watch<Rule>();

    return CustomCard(
      title: rule.name,
      description: rule.description,
      selected: selected,
      firstColumnChildren: [
        const Text('IF'),
        const SizedBox(height: 4),
        ...rule.conditions
            .map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Text('- ${e.variable.name} = ${e.value}'),
                ))
            .toList(),
      ],
      secondColumnChildren: [
        const Text('THEN'),
        const SizedBox(height: 4),
        ...rule.results
            .map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Text('- ${e.variable.name} = ${e.value}'),
                ))
            .toList(),
      ],
      onTap: onTap,
    );
  }
}
