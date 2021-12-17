import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/data_type.dart';
import '../../model/variable.dart';
import '../common/custom_card.dart';

class VariableCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool selected;

  const VariableCard({Key? key, this.onTap, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variable = context.watch<Variable>();

    return CustomCard(
      title: variable.name,
      description: variable.description,
      selected: selected,
      firstColumnChildren: [
        const Text('TYPE'),
        const SizedBox(height: 4),
        Text(variable.dataType.name()),
      ],
      secondColumnChildren: [
        const Text('DOMAIN'),
        const SizedBox(height: 4),
        Text(variable.domain?.name ?? '-'),
      ],
      onTap: onTap,
    );
  }
}
