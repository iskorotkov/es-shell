import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:provider/provider.dart';

import '../../infer/engine.dart';
import '../../infer/stack.dart';
import '../../model/project.dart';
import 'closed_question_card.dart';
import 'open_question_card.dart';
import 'question_card.dart';

class InferView extends StatefulWidget {
  const InferView({
    Key? key,
  }) : super(key: key);

  @override
  State<InferView> createState() => _InferViewState();
}

class _InferViewState extends State<InferView> {
  final List<Question> _questions = [];
  final Engine _engine = Engine();
  String? _result;
  bool _resultSet = false;
  bool _firstRender = true;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    // TODO: Make buttons inactive after future is resolved.

    if (_firstRender) {
      _firstRender = false;
      var result = _engine.infer(project, _promptUser);
      result.then((result) {
        log('result is $result');
        setState(() {
          _result = result;
          _resultSet = true;
        });
      });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Run'),
              Tab(text: 'Memory'),
              Tab(text: 'Resolution stack'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRunTab(),
            _buildMemoryTab(),
            _buildStackTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildStackTab() {
    if (_engine.stack != null) {
      return TreeView(
        theme: TreeViewTheme(
          expanderTheme: const ExpanderThemeData(
            type: ExpanderType.chevron,
          ),
          labelStyle: Theme.of(context).textTheme.bodyText2!,
          parentLabelStyle: Theme.of(context).textTheme.bodyText2!,
        ),
        controller: TreeViewController(
          children: [_buildStackTree(_engine.stack!, expanded: true)],
        ),
      );
    }

    return const Center(
      child: Text('Stack not available'),
    );
  }

  Widget _buildMemoryTab() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: _engine.memory.values.entries
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
    );
  }

  Widget _buildRunTab() {
    var questionsCards = _questions.map<Widget>((e) {
      if (e.variable.domain != null) {
        return ClosedQuestionCard(
          key: Key(e.variable.uuid),
          question: e,
        );
      }

      return OpenQuestionCard(
        key: Key(e.variable.uuid),
        question: e,
      );
    }).toList();

    if (_resultSet) {
      questionsCards.add(Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Expanded(
                child: Text('Result'),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(_result ?? '<no solution>'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: questionsCards,
    );
  }

  Node _buildStackTree(StackFrameVariable frame, {bool expanded = true}) {
    return Node(
      key: frame.variable.uuid,
      label: [
        frame.variable.name,
        if (frame.fromCache) ' (cached)',
        if (frame.variable.description.isNotEmpty)
          ' - ${frame.variable.description}',
      ].join(),
      icon: Icons.memory,
      expanded: expanded,
      children: frame.children
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

  Future<String> _promptUser(variable) {
    var completer = Completer<String>();

    setState(() {
      _questions.add(Question(
        variable: variable,
        completer: completer,
      ));
    });

    return completer.future;
  }
}
