import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        const Text('VALUES'),
        const SizedBox(height: 4),
        Text(domain.values.join("; ")),
      ],
      onTap: onTap,
    );
  }
}
