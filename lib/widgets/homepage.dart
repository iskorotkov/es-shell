import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';
import '../utils/name_generator.dart';
import '../utils/read_only_lock.dart';
import 'editor/domains_view.dart';
import 'editor/rules_view.dart';
import 'editor/target_variable_selector.dart';
import 'editor/variables_view.dart';
import 'infer/infer_view.dart';

class TabContext with ChangeNotifier {
  int _tabIndex;
  String? _entityGuid;

  TabContext({int tabIndex = 0, String? entityUuid})
      : _tabIndex = tabIndex,
        _entityGuid = entityUuid;

  String? get entityGuid => _entityGuid;

  set entityGuid(String? entityGuid) {
    _entityGuid = entityGuid;
    notifyListeners();
  }

  int get tabIndex => _tabIndex;

  set tabIndex(int tabIndex) {
    _tabIndex = tabIndex;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  final String title = 'ES Shell';
  final TabContext tabContext;
  final Project project;
  final ReadOnlyLock readOnlyLock;

  const HomePage({
    Key? key,
    required this.tabContext,
    required this.project,
    required this.readOnlyLock,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Project>.value(value: widget.project),
        ChangeNotifierProvider<ReadOnlyLock>.value(value: widget.readOnlyLock),
        ChangeNotifierProvider<TabContext>.value(value: widget.tabContext),
        Provider<NameGenerator>(create: (_) => NameGenerator()),
      ],
      child: DefaultTabController(
        initialIndex: widget.tabContext.tabIndex,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Rules'),
                Tab(text: 'Variables'),
                Tab(text: 'Domains'),
              ],
            ),
            actions: [
              Builder(builder: (context) {
                var lock = context.watch<ReadOnlyLock>();
                return IconButton(
                  icon: Icon(lock.locked ? Icons.lock : Icons.lock_open),
                  onPressed: () {
                    lock.toggle();
                  },
                );
              }),
              IconButton(
                icon: const Icon(Icons.file_download),
                onPressed: () {
                  _saveProject(widget.project);
                },
              ),
              IconButton(
                icon: const Icon(Icons.file_upload),
                onPressed: () => _loadProject(context),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => _infer(widget.project),
              ),
              const SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TargetVariableSelector(),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              RulesView(),
              VariablesView(),
              DomainsView(),
            ],
          ),
        ),
      ),
    );
  }

  _infer(Project project) {
    for (var rule in project.rules) {
      if (rule.name == '') {
        _showErrorDialog('Unnamed rule',
            'Rule doesn\'t have a name. Set the name or delete the rule before proceeding.');
        return;
      }

      if (project.rules.where((element) => element.name == rule.name).length !=
          1) {
        _showErrorDialog('Duplicated rule name',
            'Several rules with the same name "${rule.name}" exist.');
        return;
      }
    }

    for (var variable in project.variables) {
      if (variable.name == '') {
        _showErrorDialog('Unnamed variable',
            'Variable doesn\'t have a name. Set the name or delete the variable before proceeding.');
        return;
      }

      if (project.variables
              .where((element) => element.name == variable.name)
              .length !=
          1) {
        _showErrorDialog('Duplicated variable name',
            'Several variables with the same name "${variable.name}" exist.');
        return;
      }
    }

    var domainsWithoutValues =
        project.domains.where((element) => element.values.isEmpty);
    if (domainsWithoutValues.isNotEmpty) {
      _showErrorDialog('Domain(s) have no values',
          'Domain(s) ${domainsWithoutValues.map((e) => '"${e.name}"').join(', ')} have no values in them.');
      return;
    }

    for (var domain in project.domains) {
      if (domain.name == '') {
        _showErrorDialog('Unnamed domain',
            'Domain doesn\'t have a name. Set the name or delete the domain before proceeding.');
        return;
      }

      if (project.domains
              .where((element) => element.name == domain.name)
              .length !=
          1) {
        _showErrorDialog('Duplicated domain name',
            'Several domains with the same name "${domain.name}" exist.');
        return;
      }

      var values = <String, int>{};
      for (var element in domain.values) {
        var curValue = values[element] ?? 0;
        values[element] = curValue + 1;
      }

      var duplicatedValues = values.entries
          .where((element) => element.value > 1)
          .map((e) => e.key)
          .toList();
      if (duplicatedValues.isNotEmpty) {
        _showErrorDialog('Domain has duplicated items',
            'Domain "${domain.name}" has duplicated value(s): ${duplicatedValues.map((e) => '"$e"').join(', ')}.');
        return;
      }
    }

    log('running infer engine');

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (context) {
        return ChangeNotifierProvider<Project>.value(
          value: project,
          child: const InferView(),
        );
      },
    ));
  }

  _loadProject(BuildContext context) {
    FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['es', 'json'],
    ).then((value) {
      if (value == null) {
        log('no files selected');
        return;
      }

      log('loading from ${value.paths.first}');

      try {
        var file = File(value.paths.first!);
        file.readAsString().then((value) {
          try {
            var loaded = Project.fromJson(jsonDecode(value));

            for (var variable in loaded.variables) {
              if (variable.domain != null) {
                variable.domain = loaded.domains.firstWhere(
                    (element) => element.uuid == variable.domain?.uuid);
              }
            }

            for (var rule in loaded.rules) {
              for (var condition in rule.conditions) {
                condition.variable = loaded.variables.firstWhere(
                    (element) => element.uuid == condition.variable.uuid);
              }

              for (var result in rule.results) {
                result.variable = loaded.variables.firstWhere(
                    (element) => element.uuid == result.variable.uuid);
              }
            }

            loaded.target = loaded.variables
                .firstWhere((e) => e.uuid == loaded.target.uuid);

            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(
                tabContext: widget.tabContext,
                project: loaded,
                readOnlyLock: widget.readOnlyLock,
              ),
            ));

            log('loaded project from file');
          } catch (e) {
            log('error decoding project: $e');
          }
        });
      } catch (e) {
        log('error reading file: $e');
      }
    });
  }

  _saveProject(Project project) {
    FilePicker.platform.saveFile(
      fileName: 'project.es',
      type: FileType.custom,
      allowedExtensions: ['es', 'json'],
    ).then((value) {
      if (value == null) {
        log('no file selected');
        return;
      }

      log('saving to $value');

      try {
        var file = File(value);
        var json = jsonEncode(project.toJson());

        file.writeAsString(json);
      } catch (e) {
        log('error writing file: $e');
      }
    });
  }

  _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
