import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';
import '../model/rule.dart';
import '../model/variable.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'rule_card.dart';

class RulesView extends StatelessWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Rule>(
      sidebar: [
        TextField(
          controller: TextEditingController()..text = 'Rule name',
        ),
        TextField(
          controller: TextEditingController()..text = 'Rule description',
        ),
        CustomViewHeading(
          text: 'Conditions',
          onAdd: () {},
        ),
        const ConditionEditor(),
        CustomViewHeading(
          text: 'Facts',
          onAdd: () {},
        ),
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
    var project = context.watch<Project>();
    // var fact = context.watch<Fact>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<Variable>(
          value: project.variables.first,
          onChanged: (s) {},
          items: project.variables
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
        const Text('='),
        DropdownButton<Variable>(
          value: project.variables.first,
          onChanged: (s) {},
          items: project.variables
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class FactEditor extends StatelessWidget {
  const FactEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();
    // var fact = context.watch<Fact>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<Variable>(
          value: project.variables.first,
          onChanged: (s) {},
          items: project.variables
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
        const Text('='),
        DropdownButton<Variable>(
          value: project.variables.first,
          onChanged: (s) {},
          items: project.variables
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
