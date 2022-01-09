import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/domain.dart';
import '../../model/project.dart';
import '../../model/variable.dart';
import '../../model/variable_type.dart';
import '../../utils/name_generator.dart';
import '../../utils/read_only_lock.dart';
import '../common/custom_autocomplete.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import '../homepage.dart';
import 'variable_card.dart';

class VariablesView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController questionController = TextEditingController();

  VariablesView({Key? key}) : super(key: key);

  @override
  State<VariablesView> createState() => _VariablesViewState();
}

class _VariablesViewState extends State<VariablesView> {
  Variable? _selected;
  bool _firstRender = true;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();
    var nameGenerator = context.read<NameGenerator>();

    var tabContext = context.read<TabContext>();
    if (_firstRender && tabContext.entityGuid != null) {
      Future.microtask(() {
        setState(() {
          _select(project.variables
              .firstWhere((element) => element.uuid == tabContext.entityGuid));
          _firstRender = false;
        });
      });
    }

    return CustomView<Variable>(
      sidebar: _selected != null ? _buildSidebar(project) : [],
      items: project.variables,
      itemBuilder: (_, variable) => ChangeNotifierProvider<Variable>.value(
        key: Key(variable.uuid),
        value: variable,
        child: VariableCard(
          selected: _selected == variable,
          onTap: () {
            setState(() {
              _select(variable);
            });
          },
        ),
      ),
      onCreate: () {
        var created = Variable(
            uuid: const Uuid().v4(),
            name: nameGenerator.generate(
                'Variable', project.variables.map((e) => e.name).toList()),
            description: '',
            question: '');

        if (_selected == null) {
          project.variables = [...project.variables, created];
        } else {
          var index = project.variables.indexOf(_selected!);
          project.variables = [
            ...project.variables.sublist(0, index + 1),
            created,
            ...project.variables.sublist(index + 1)
          ];
        }
      },
      onDelete: () {
        var rulesWithVariable = project.rules.where((e) =>
            e.results.map((e) => e.variable).contains(_selected) ||
            e.conditions.map((e) => e.variable).contains(_selected));
        if (rulesWithVariable.isNotEmpty) {
          var names = rulesWithVariable.map((e) => '"${e.name}"').join(', ');

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Can\'t delete variable'),
              content: Text(
                  'Variable "${_selected!.name}" is used in rule${rulesWithVariable.length == 1 ? '' : 's'} $names'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );

          return;
        }

        if (project.target == _selected) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Can\'t delete variable'),
              content: Text(
                  'Variable "${_selected!.name}" is used as a target variable'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );

          return;
        }

        project.variables =
            project.variables.where((element) => element != _selected).toList();

        setState(() {
          _selected = null;
        });
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
      TextField(
        controller: widget.questionController,
        onChanged: (value) {
          _selected!.question = value;
        },
        decoration: const InputDecoration(hintText: 'Enter question...'),
      ),
      const CustomViewHeading(text: 'Type'),
      DropdownButtonFormField<VariableType>(
        value: _selected!.variableType,
        onChanged: (value) {
          _selected!.variableType = value ?? _selected!.variableType;
        },
        items: VariableType.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.uiName()),
                  value: e,
                ))
            .toList(),
      ),
      const CustomViewHeading(text: 'Domain'),
      Builder(builder: (context) {
        var readOnlyLock = context.read<ReadOnlyLock>();
        return CustomAutocomplete(
          value: _selected!.domain?.name,
          items: project.domains.map((e) => e.name),
          optional: true,
          onCreateNew: (value) {
            var created = Domain(
              uuid: const Uuid().v4(),
              name: value,
              description: '',
              values: const [],
            );

            project.domains = [...project.domains, created];

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage(
                tabContext: TabContext(
                  tabIndex: 2,
                  entityUuid: created.uuid,
                ),
                project: project,
                readOnlyLock: readOnlyLock,
              ),
            ));
          },
          onChanged: (value) {
            _selected!.domain = value == null
                ? null
                : project.domains.firstWhere((e) => e.name == value);
          },
        );
      }),
    ];
  }

  void _select(Variable variable) {
    _selected = variable;
    widget.nameController.text = variable.name;
    widget.descriptionController.text = variable.description;
    widget.questionController.text = variable.question ?? '';
  }
}
