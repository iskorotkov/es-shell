import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/domain.dart';
import 'custom_card.dart';

class DomainCard extends StatelessWidget {
  const DomainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var domain = context.watch<Domain>();

    return CustomCard(
      title: domain.name,
      description: domain.description,
      firstColumnChildren: [
        const Text('VALUES'),
        const SizedBox(height: 4),
        ...domain.values.map((e) => Text(e.toString())).toList(),
      ],
    );
  }
}
