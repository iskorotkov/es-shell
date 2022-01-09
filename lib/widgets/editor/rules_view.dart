import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/fact.dart';
import '../../model/project.dart';
import '../../model/rule.dart';
import '../../model/variable.dart';
import '../../model/variable_type.dart';
import '../../utils/name_generator.dart';
import '../../utils/read_only_lock.dart';
import '../common/custom_autocomplete.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import '../homepage.dart';
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
    var nameGenerator = context.read<NameGenerator>();
    return CustomView<Rule>(
      sidebar: _selected != null ? _buildSidebar(project) : [],
      items: project.rules,
      itemBuilder: (_, rule) => ChangeNotifierProvider<Rule>.value(
        key: Key(rule.uuid),
        value: rule,
        child: RuleCard(
          selected: _selected == rule,
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
        var created = Rule(
          uuid: const Uuid().v4(),
          name: nameGenerator.generate(
              'Rule', project.rules.map((e) => e.name).toList()),
          description: '',
          conditions: const [],
          results: const [],
        );

        if (_selected == null) {
          project.rules = [...project.rules, created];
        } else {
          var index = project.rules.indexOf(_selected!);
          project.rules = [
            ...project.rules.sublist(0, index + 1),
            created,
            ...project.rules.sublist(index + 1)
          ];
        }
      },
      onDelete: () {
        project.rules =
            project.rules.where((element) => element != _selected).toList();
        _selected = null;
      },
      onClose: () {
        setState(() {
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
          _selected!.name = value;
        },
        decoration: const InputDecoration(hintText: 'Enter name...'),
      ),
      TextField(
        controller: widget.descriptionController,
        onChanged: (value) {
          _selected!.description = value;
        },
        decoration: const InputDecoration(hintText: 'Enter description...'),
      ),
      CustomViewHeading(
        text: 'Conditions',
        onAdd: () {
          _selected!.conditions = [
            ..._selected!.conditions,
            Fact(
              uuid: const Uuid().v4(),
              variable: project.variables.first,
              value: '',
            )
          ];

          setState(() {
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
                child: Builder(builder: (context) {
                  var readOnlyLock = context.read<ReadOnlyLock>();
                  return CustomAutocomplete(
                    value: _selected!.conditions[i].variable.name,
                    items: project.variables.map((e) => e.name),
                    onCreateNew: (value) {
                      var created = Variable(
                        uuid: const Uuid().v4(),
                        name: value,
                        description: '',
                        variableType: VariableType.inferred,
                        domain: null,
                      );

                      project.variables = [...project.variables, created];

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                          tabContext: TabContext(
                            tabIndex: 1,
                            entityUuid: created.uuid,
                          ),
                          project: project,
                          readOnlyLock: readOnlyLock,
                        ),
                      ));
                    },
                    onChanged: (value) {
                      _selected!.conditions[i].variable =
                          project.variables.firstWhere((e) => e.name == value);
                    },
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('='),
              ),
              Expanded(
                child: _selected!.conditions[i].variable.domain != null
                    ? CustomAutocomplete(
                        items: _selected!.conditions[i].variable.domain!.values,
                        value: _selected!.conditions[i].value,
                        onCreateNew: (value) {
                          _selected!.conditions[i].variable.domain!.values = [
                            ..._selected!.conditions[i].variable.domain!.values,
                            value
                          ];
                        },
                        onChanged: (value) {
                          _selected!.conditions[i].value = value?.toString() ??
                              _selected!.conditions[i].value;
                        },
                      )
                    : TextField(
                        controller: _conditionsControllers[i],
                        onChanged: (value) {
                          _selected!.conditions[i].value = value;
                        },
                      ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  _selected!.conditions = [
                    ..._selected!.conditions.sublist(0, i),
                    ..._selected!.conditions.sublist(i + 1)
                  ];
                },
              ),
            ],
          ),
        ),
      CustomViewHeading(
        text: 'Results',
        onAdd: () {
          _selected!.results = [
            ..._selected!.results,
            Fact(
              uuid: const Uuid().v4(),
              variable: project.variables
                  .where((element) =>
                      element.variableType != VariableType.prompted)
                  .first,
              value: '',
            )
          ];

          setState(() {
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
                child: Builder(builder: (context) {
                  var readOnlyLock = context.read<ReadOnlyLock>();
                  return CustomAutocomplete(
                    value: _selected!.results[i].variable.name,
                    items: project.variables
                        .where((e) => e.variableType == VariableType.inferred)
                        .map((e) => e.name),
                    onCreateNew: (value) {
                      var created = Variable(
                        uuid: const Uuid().v4(),
                        name: value,
                        description: '',
                        variableType: VariableType.inferred,
                        domain: null,
                      );

                      project.variables = [...project.variables, created];

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                          tabContext: TabContext(
                            tabIndex: 1,
                            entityUuid: created.uuid,
                          ),
                          project: project,
                          readOnlyLock: readOnlyLock,
                        ),
                      ));
                    },
                    onChanged: (value) {
                      _selected!.results[i].variable =
                          project.variables.firstWhere((e) => e.name == value);
                    },
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('='),
              ),
              Expanded(
                child: _selected!.results[i].variable.domain != null
                    ? CustomAutocomplete(
                        value: _selected!.results[i].value,
                        items: _selected!.results[i].variable.domain!.values,
                        onCreateNew: (value) {
                          _selected!.results[i].variable.domain!.values = [
                            ..._selected!.results[i].variable.domain!.values,
                            value
                          ];
                        },
                        onChanged: (value) {
                          _selected!.results[i].value =
                              value?.toString() ?? _selected!.results[i].value;
                        },
                      )
                    : TextField(
                        controller: _resultsControllers[i],
                        onChanged: (value) {
                          _selected!.results[i].value = value;
                        },
                      ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  _selected!.results = [
                    ..._selected!.results.sublist(0, i),
                    ..._selected!.results.sublist(i + 1)
                  ];
                },
              ),
            ],
          ),
        ),
    ];
  }
}
