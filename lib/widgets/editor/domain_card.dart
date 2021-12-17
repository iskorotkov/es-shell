import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/data_type.dart';
import '../../model/domain.dart';
import '../common/custom_card.dart';

class DomainCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool selected;

  const DomainCard({Key? key, this.onTap, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var domain = context.watch<Domain>();

    return CustomCard(
      title: domain.name,
      description: domain.description,
      selected: selected,
      firstColumnChildren: [
        const Text('TYPE'),
        const SizedBox(height: 4),
        Text(domain.dataType.name()),
      ],
      secondColumnChildren: [
        const Text('VALUES'),
        const SizedBox(height: 4),
        ...domain.values.map((e) => Text(e.toString())).toList(),
      ],
      onTap: onTap,
    );
  }
}
