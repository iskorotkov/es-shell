import 'package:flutter/material.dart';

import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'variable_card.dart';

class VariablesView extends StatelessWidget {
  const VariablesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Variable name',
      description: 'Variable description',
      children: [
        const CustomViewHeading(text: 'Type'),
        DropdownButton<String>(
          value: 'string',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('String'), value: 'string'),
            DropdownMenuItem(child: Text('Integer'), value: 'int'),
          ],
        ),
        const CustomViewHeading(text: 'Domain'),
        DropdownButton<String>(
          value: 'domain1',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('Domain1'), value: 'domain1'),
            DropdownMenuItem(child: Text('Domain2'), value: 'domain2'),
          ],
        ),
      ],
      itemBuilder: (_, index) => VariableCard(index: index),
      onDelete: () {},
    );
  }
}
