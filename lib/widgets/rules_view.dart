import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/fact.dart';
import '../model/project.dart';
import '../model/rule.dart';
import '../model/variable.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'rule_card.dart';

class RulesView extends StatefulWidget {
  const RulesView({Key? key}) : super(key: key);

  @override
  State<RulesView> createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  Rule? _selected;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Rule>(
      sidebar: _selected != null ? _buildSidebar(project) : [],
      items: project.rules,
      itemBuilder: (_, rule) => ChangeNotifierProvider<Rule>.value(
        value: rule,
        child: RuleCard(
          onTap: () {
            setState(() {
              _selected = rule;
            });
          },
        ),
      ),
      onCreate: () {
        setState(() {
          project.rules.add(Rule(
            name: 'New rule #${Random().nextInt(1000)}',
            description: '',
            conditions: [],
            results: [],
          ));
        });
      },
      onDelete: () {
        setState(() {
          project.rules.remove(_selected);
          _selected = null;
        });
      },
    );
  }

  List<Widget> _buildSidebar(Project project) {
    return [
      TextField(
        controller: TextEditingController()..text = _selected!.name,
        onSubmitted: (value) {
          setState(() {
            _selected!.name = value;
          });
        },
      ),
      TextField(
        controller: TextEditingController()..text = _selected!.description,
        onSubmitted: (value) {
          setState(() {
            _selected!.description = value;
          });
        },
      ),
      CustomViewHeading(
        text: 'Conditions',
        onAdd: () {
          setState(() {
            _selected!.conditions.add(Fact(
              variable: project.variables.first,
              value: '',
            ));
          });
        },
      ),
      for (var condition in _selected!.conditions)
        ChangeNotifierProvider<Fact>.value(
          value: condition,
          child: const ConditionEditor(),
        ),
      CustomViewHeading(
        text: 'Results',
        onAdd: () {
          setState(() {
            _selected!.results.add(Fact(
              variable: project.variables.first,
              value: '',
            ));
          });
        },
      ),
      for (var result in _selected!.results)
        ChangeNotifierProvider<Fact>.value(
          value: result,
          child: const ResultEditor(),
        ),
    ];
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

class ResultEditor extends StatelessWidget {
  const ResultEditor({Key? key}) : super(key: key);

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
