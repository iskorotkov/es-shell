import 'package:flutter/material.dart';

import 'custom_card.dart';

class DomainCard extends StatelessWidget {
  final int index;

  const DomainCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      index: index,
      title: 'Some domain',
      description: 'Long description of what this domain is for',
      firstColumnChildren: const [
        Text('VALUES'),
        SizedBox(height: 4),
        Text("one"),
        Text("two"),
        Text("three"),
        Text("four or more"),
      ],
    );
  }
}
