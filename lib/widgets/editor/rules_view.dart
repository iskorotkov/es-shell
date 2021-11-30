import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/fact.dart';
import '../../model/project.dart';
import '../../model/rule.dart';
import '../../model/variable.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import 'rule_card.dart';

class RulesView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RulesView({Key? key}) : super(key: key);

  @override
  State<RulesView> createState() => _RulesViewState();
}

class _RulesViewState extends State<RulesView> {
  Rule? _selected;
  List<TextEditingController> _conditionsControllers =
      <TextEditingController>[];
  List<TextEditingController> _resultsControllers = <TextEditingController>[];

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
              widget.nameController.text = rule.name;
              widget.descriptionController.text = rule.description;

              _conditionsControllers = List.filled(
                rule.conditions.length,
                TextEditingController(),
                growable: true,
              );

              _conditionsControllers.setAll(
                0,
                rule.conditions.map(
                    (e) => TextEditingController()..text = e.value.toString()),
              );

              _resultsControllers = List.filled(
                rule.conditions.length,
                TextEditingController(),
                growable: true,
              );

              _resultsControllers.setAll(
                0,
                rule.conditions.map(
                    (e) => TextEditingController()..text = e.value.toString()),
              );
            });
          },
        ),
      ),
      onCreate: () {
        setState(() {
          project.rules.add(Rule(
            uuid: const Uuid().v4(),
            name: '',
            description: '',
            conditions: const [],
            results: const [],
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
        controller: widget.nameController,
        onChanged: (value) {
          setState(() {
            _selected!.name = value;
          });
        },
      ),
      TextField(
        controller: widget.descriptionController,
        onChanged: (value) {
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
              uuid: const Uuid().v4(),
              variable: project.variables.first,
              value: '',
            ));

            _conditionsControllers.add(TextEditingController());
          });
        },
      ),
      for (var i = 0; i < _selected!.conditions.length; i++)
        ChangeNotifierProvider<Fact>.value(
          value: _selected!.conditions[i],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButtonFormField<Variable>(
                  value: _selected!.conditions[i].variable,
                  onChanged: (value) {
                    setState(() {
                      _selected!.conditions[i].variable =
                          value ?? _selected!.conditions[i].variable;
                    });
                  },
                  items: project.variables
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('='),
              ),
              Expanded(
                child: TextField(
                  controller: _conditionsControllers[i],
                  onChanged: (value) {
                    setState(() {
                      _selected!.conditions[i].value = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      CustomViewHeading(
        text: 'Results',
        onAdd: () {
          setState(() {
            _selected!.results.add(Fact(
              uuid: const Uuid().v4(),
              variable: project.variables.first,
              value: '',
            ));

            _resultsControllers.add(TextEditingController());
          });
        },
      ),
      for (var i = 0; i < _selected!.results.length; i++)
        ChangeNotifierProvider<Fact>.value(
          value: _selected!.results[i],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButtonFormField<Variable>(
                  value: _selected!.results[i].variable,
                  onChanged: (value) {
                    setState(() {
                      _selected!.results[i].variable =
                          value ?? _selected!.results[i].variable;
                    });
                  },
                  items: project.variables
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('='),
              ),
              Expanded(
                child: TextField(
                  controller: _resultsControllers[i],
                  onChanged: (value) {
                    setState(() {
                      _selected!.results[i].value = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
    ];
  }
}
