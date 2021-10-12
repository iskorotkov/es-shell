import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';
import '../model/rule.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'rule_card.dart';

class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Rule>(
      title: 'Rule name',
      description: 'Rule description',
      sidebar: [
        CustomViewHeading(
          text: 'Conditions',
          onAdd: () {},
        ),
        const ConditionEditor(),
        const ConditionEditor(),
        CustomViewHeading(
          text: 'Facts',
          onAdd: () {},
        ),
        const FactEditor(),
        const FactEditor(),
      ],
      items: project.rules,
      itemBuilder: (_, rule) => Provider<Rule>.value(
        value: rule,
        child: const RuleCard(),
      ),
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
