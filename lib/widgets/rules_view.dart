import 'package:flutter/material.dart';

import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'rule_card.dart';

class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Rule Name',
      description: 'Rule description',
      children: const [
        CustomViewHeading(text: 'Conditions'),
        ConditionEditor(),
        ConditionEditor(),
        CustomViewHeading(text: 'Facts'),
        FactEditor(),
        FactEditor(),
      ],
      itemBuilder: (_, index) => RuleCard(index: index),
      onDelete: () {},
    );
  }
}

class ConditionEditor extends StatelessWidget {
  const ConditionEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<String>(
          value: 'var1',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('var1'), value: 'var1'),
            DropdownMenuItem(child: Text('var2'), value: 'var2'),
          ],
        ),
        const Text('='),
        DropdownButton<String>(
          value: 'var1',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('var1'), value: 'var1'),
            DropdownMenuItem(child: Text('var2'), value: 'var2'),
          ],
        ),
      ],
    );
  }
}

class FactEditor extends StatelessWidget {
  const FactEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<String>(
          value: 'var1',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('var1'), value: 'var1'),
            DropdownMenuItem(child: Text('var2'), value: 'var2'),
          ],
        ),
        const Text('='),
        DropdownButton<String>(
          value: 'var1',
          onChanged: (s) {},
          items: const [
            DropdownMenuItem(child: Text('var1'), value: 'var1'),
            DropdownMenuItem(child: Text('var2'), value: 'var2'),
          ],
        ),
      ],
    );
  }
}
