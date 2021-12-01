import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../model/data_type.dart';
import '../../model/domain.dart';
import '../../model/project.dart';
import '../../model/variable.dart';
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
        value: variable,
        child: VariableCard(
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
        setState(() {
          project.variables.add(Variable(
            uuid: const Uuid().v4(),
            name: '',
            description: '',
            dataType: DataType.int,
          ));
        });
      },
      onDelete: () {
        setState(() {
          project.variables.remove(_selected);
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
      DropdownButtonFormField<DataType>(
        value: _selected!.dataType,
        onChanged: (value) {
          setState(() {
            _selected!.dataType = value ?? _selected!.dataType;
          });
        },
        items: DataType.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.name()),
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
              dataType: DataType.string,
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
