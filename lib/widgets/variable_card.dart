import 'package:flutter/material.dart';

import 'custom_card.dart';

class VariableCard extends StatelessWidget {
  final int index;

  const VariableCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      index: index,
      title: 'Some rule',
      description: 'Long description of what this variable is for',
      firstColumnChildren: const [
        Text('TYPE'),
        SizedBox(height: 4),
        Text("Integer"),
      ],
      secondColumnChildren: const [
        Text('DOMAIN'),
        SizedBox(height: 4),
        Text("Domain1"),
      ],
    );
  }
}
