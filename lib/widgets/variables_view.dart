import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_type.dart';
import '../model/domain.dart';
import '../model/project.dart';
import '../model/variable.dart';
import 'custom_view.dart';
import 'custom_view_heading.dart';
import 'variable_card.dart';

class VariablesView extends StatelessWidget {
  const VariablesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return CustomView<Variable>(
      sidebar: [
        TextField(
          controller: TextEditingController()..text = 'Variable name',
        ),
        TextField(
          controller: TextEditingController()..text = 'Variable description',
        ),
        const CustomViewHeading(text: 'Type'),
        DropdownButton<DataType>(
          value: DataType.int,
          onChanged: (s) {},
          items: DataType.values
              .map((e) => DropdownMenuItem(
                    child: Text(e.name()),
                    value: e,
                  ))
              .toList(),
        ),
        const CustomViewHeading(text: 'Domain'),
        DropdownButton<Domain>(
          value: project.domains.first,
          onChanged: (s) {},
          items: project.domains
              .map((d) => DropdownMenuItem(
                    child: Text(d.name),
                    value: d,
                  ))
              .toList(),
        ),
      ],
      items: project.variables,
      itemBuilder: (_, variable) => Provider<Variable>.value(
        value: variable,
        child: const VariableCard(),
      ),
      onDelete: () {},
    );
  }
}
