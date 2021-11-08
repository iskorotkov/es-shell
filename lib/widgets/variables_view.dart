import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_type.dart';
import '../model/domain.dart';
import '../model/project.dart';
import '../model/variable.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'variable_card.dart';

class VariablesView extends StatefulWidget {
  const VariablesView({Key? key}) : super(key: key);

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
            });
          },
        ),
      ),
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
      const CustomViewHeading(text: 'Type'),
      DropdownButton<DataType>(
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
      DropdownButton<Domain>(
        value: _selected!.domain,
        onChanged: (value) {
          setState(() {
            _selected!.domain = value;
          });
        },
        items: [
          ...project.domains
              .map((d) => DropdownMenuItem(
                    child: Text(d.name),
                    value: d,
                  ))
              .toList(),
          const DropdownMenuItem(
            child: Text('<none>'),
            value: null,
          ),
        ],
      ),
    ];
  }
}
