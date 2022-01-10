import 'dart:async';
import 'dart:developer';

import 'package:es_shell/infer/memory.dart';
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
  bool _expandStack = true;
  bool _showVariables = false;
  bool _showOnlyMatchedRules = true;

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

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

  Widget _buildMemoryTab() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: _engine.memory.variables.entries
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

  Node _buildRuleStackNode(StackFrameRule frame, Memory memory) {
    var variablesNodes =
        frame.children.map((e) => _buildVariableStackNode(e, memory)).toList();

    var rulesNodes = frame.children
        .map((element) => element.children)
        .reduce((l1, l2) => [...l1, ...l2])
        .map((e) => _buildRuleStackNode(e, memory))
        .toList();

    return Node(
      key: frame.rule.uuid,
      label: _labelForRule(frame, memory),
      expanded: _expandStack,
      icon: Icons.rule,
      iconColor: frame.matched ? Colors.green : Colors.red,
      children: _showVariables ? variablesNodes : rulesNodes,
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

  Widget _buildStackTab() {
    if (_engine.stack != null) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _expandStack = true;
                      });
                    },
                    child: const Text('Expand all'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _expandStack = false;
                      });
                    },
                    child: const Text('Collapse all'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: LimitedBox(
                    maxWidth: 200,
                    child: CheckboxListTile(
                      title: const Text('Show only matched rules'),
                      value: _showOnlyMatchedRules,
                      onChanged: (value) {
                        setState(() {
                          _showOnlyMatchedRules =
                              value ?? _showOnlyMatchedRules;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: LimitedBox(
                    maxWidth: 200,
                    child: CheckboxListTile(
                      title: const Text('Show variables'),
                      value: _showVariables,
                      onChanged: (value) {
                        setState(() {
                          _showVariables = value ?? _showVariables;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TreeView(
                theme: TreeViewTheme(
                  expanderTheme: const ExpanderThemeData(
                    type: ExpanderType.chevron,
                  ),
                  labelStyle: Theme.of(context).textTheme.bodyText2!,
                  parentLabelStyle: Theme.of(context).textTheme.bodyText2!,
                ),
                controller: TreeViewController(
                  children: [
                    _buildVariableStackNode(_engine.stack!, _engine.memory)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const Center(
      child: Text('Stack not available'),
    );
  }

  Node _buildVariableStackNode(StackFrameVariable frame, Memory memory) {
    var rulesNodes = frame.children
        // Filter out unmatched rules if necessary.
        .where((element) => !_showOnlyMatchedRules || element.matched)
        .map((e) => _buildRuleStackNode(e, memory))
        .toList();

    return Node(
      key: frame.variable.uuid,
      label: _labelForVariable(frame, memory),
      icon: Icons.memory,
      expanded: _expandStack,
      iconColor:
          memory.variables[frame.variable] != null ? Colors.green : Colors.red,
      children: rulesNodes,
    );
  }

  String _labelForRule(StackFrameRule e, Memory memory) {
    return [
      e.rule.name,
      if (e.rule.description.isNotEmpty) ' (${e.rule.description})',
      e.matched ? ' - matched' : ' - not matched',
    ].join();
  }

  String _labelForVariable(StackFrameVariable frame, Memory memory) {
    return [
      frame.variable.name,
      if (frame.variable.description.isNotEmpty)
        ' (${frame.variable.description})',
      if (memory.variables.containsKey(frame.variable)) ...[
        ' = ',
        memory.variables[frame.variable]
      ],
      if (frame.fromCache) ' (cached)',
    ].join();
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
