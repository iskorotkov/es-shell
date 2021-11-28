import 'package:es_shell/infer/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:provider/provider.dart';

import '../infer/engine.dart';
import '../model/project.dart';

class InferView extends StatelessWidget {
  const InferView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    var engine = Engine();
    engine.memory.values[project.variables[0]] = 0;
    engine.memory.values[project.variables[2]] = 2;

    engine.infer(project);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Memory'),
              Tab(text: 'Resolution stack'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(8),
              children: engine.memory.values.entries
                  .map(
                    (entry) => Card(
                      elevation: 8,
                      child: ListTile(
                        key: Key(entry.key.uuid),
                        title: Text(entry.key.name),
                        subtitle: Text(entry.key.description),
                        trailing: Text(entry.value.toString()),
                      ),
                    ),
                  )
                  .toList(),
            ),
            TreeView(
              theme: TreeViewTheme(
                expanderTheme: const ExpanderThemeData(
                  type: ExpanderType.chevron,
                ),
                labelStyle: Theme.of(context).textTheme.bodyText2!,
                parentLabelStyle: Theme.of(context).textTheme.bodyText2!,
              ),
              controller: TreeViewController(
                children: [
                  _buildStackTree(engine.stack!, expanded: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Node _buildStackTree(StackFrameVariable stack, {bool expanded = true}) {
    return Node(
      key: stack.variable.uuid,
      label: [
        stack.variable.name,
        if (stack.fromCache) ' (cached)',
        if (stack.variable.description.isNotEmpty)
          ' - ${stack.variable.description}',
      ].join(),
      icon: Icons.memory,
      expanded: expanded,
      children: stack.children
          .map((e) => Node(
                key: e.rule.uuid,
                label: [
                  (e.rule.name),
                  if (e.rule.description.isNotEmpty) ' - ${e.rule.description}'
                ].join(),
                expanded: expanded,
                icon: Icons.rule,
                children: e.children
                    .map((e) => _buildStackTree(e, expanded: expanded))
                    .toList(),
              ))
          .toList(),
    );
  }
}
