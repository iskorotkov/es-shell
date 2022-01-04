import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/project.dart';
import '../../model/variable.dart';
import '../../utils/read_only_lock.dart';

class TargetVariableSelector extends StatelessWidget {
  const TargetVariableSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();
    var lock = context.watch<ReadOnlyLock>();
    return DropdownButtonFormField(
      onChanged: lock.locked
          ? null
          : (value) {
              project.target = value as Variable? ?? project.target;
            },
      value: project.target,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Colors.white,
          ),
      dropdownColor: Theme.of(context).primaryColor,
      isExpanded: true,
      items: project.variables
          .map((e) => DropdownMenuItem(
                key: Key(e.uuid),
                value: e,
                child: Text(
                  e.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
    );
  }
}
