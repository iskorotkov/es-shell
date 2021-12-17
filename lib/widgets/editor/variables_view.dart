import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/domain.dart';
import '../../model/project.dart';
import '../../model/variable.dart';
import '../../model/variable_type.dart';
import '../common/custom_autocomplete.dart';
import '../common/custom_view.dart';
import '../common/custom_view_heading.dart';
import 'variable_card.dart';

class VariablesView extends StatefulWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  VariablesView({Key? key}) : super(key: key);

  @override
  State<VariablesView> createState() => _VariablesViewState();
}

class _VariablesViewState extends State<VariablesView> {
  Variable? _selected;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

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
              _selected = variable;
              widget.nameController.text = variable.name;
              widget.descriptionController.text = variable.description;
            });
          },
        ),
      ),
      onCreate: () {
        var created = Variable(
          uuid: const Uuid().v4(),
          name: '',
          description: '',
        );

        if (_selected == null) {
          setState(() {
            project.variables.add(created);
          });
        } else {
          setState(() {
            var index = project.variables.indexOf(_selected!);
            project.variables.insert(index + 1, created);
          });
        }
      },
      onDelete: () {
        var rulesWithVariable = project.rules.where((e) =>
            e.results.map((e) => e.variable).contains(_selected) ||
            e.conditions.map((e) => e.variable).contains(_selected));
        if (rulesWithVariable.isNotEmpty || project.target == _selected) {
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

        setState(() {
          project.variables.remove(_selected);
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
      const CustomViewHeading(text: 'Type'),
      DropdownButtonFormField<VariableType>(
        value: _selected!.variableType,
        onChanged: (value) {
          setState(() {
            _selected!.variableType = value ?? _selected!.variableType;
          });
        },
        items: VariableType.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.uiName()),
                  value: e,
                ))
            .toList(),
      ),
      const CustomViewHeading(text: 'Domain'),
      CustomAutocomplete(
        value: _selected!.domain?.name,
        items: project.domains.map((e) => e.name),
        optional: true,
        onCreateNew: (value) {
          setState(() {
            project.domains.add(Domain(
              uuid: const Uuid().v4(),
              name: value,
              description: '',
              values: const [],
            ));
          });
        },
        onChanged: (value) {
          setState(() {
            _selected!.domain = value == null
                ? null
                : project.domains.firstWhere((e) => e.name == value);
          });
        },
      ),
    ];
  }
}
