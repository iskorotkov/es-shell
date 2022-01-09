import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/project.dart';
import 'sample_project.dart';
import 'utils/name_generator.dart';
import 'utils/read_only_lock.dart';
import 'widgets/editor/domains_view.dart';
import 'widgets/editor/rules_view.dart';
import 'widgets/editor/target_variable_selector.dart';
import 'widgets/editor/variables_view.dart';
import 'widgets/infer/infer_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ES Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'ES Shell'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  final ReadOnlyLock _readOnlyLock = ReadOnlyLock(true);

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Project _project = createSampleProject();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Project>.value(value: _project),
        ChangeNotifierProvider<ReadOnlyLock>.value(value: widget._readOnlyLock),
        Provider<NameGenerator>(create: (_) => NameGenerator()),
      ],
      child: DefaultTabController(
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
                onPressed: _saveProject,
              ),
              IconButton(
                icon: const Icon(Icons.file_upload),
                onPressed: _loadProject,
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => _infer(context),
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

  _infer(BuildContext context) {
    for (var rule in _project.rules) {
      if (rule.name == '') {
        _showErrorDialog('Unnamed rule',
            'Rule doesn\'t have a name. Set the name or delete the rule before proceeding.');
        return;
      }

      if (_project.rules.where((element) => element.name == rule.name).length !=
          1) {
        _showErrorDialog('Duplicated rule name',
            'Several rules with the same name "${rule.name}" exist.');
        return;
      }
    }

    for (var variable in _project.variables) {
      if (variable.name == '') {
        _showErrorDialog('Unnamed variable',
            'Variable doesn\'t have a name. Set the name or delete the variable before proceeding.');
        return;
      }

      if (_project.variables
              .where((element) => element.name == variable.name)
              .length !=
          1) {
        _showErrorDialog('Duplicated variable name',
            'Several variables with the same name "${variable.name}" exist.');
        return;
      }
    }

    for (var domain in _project.domains) {
      if (domain.name == '') {
        _showErrorDialog('Unnamed domain',
            'Domain doesn\'t have a name. Set the name or delete the domain before proceeding.');
        return;
      }

      if (_project.domains
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
          value: _project,
          child: const InferView(),
        );
      },
    ));
  }

  _loadProject() {
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

            setState(() {
              _project = loaded;
            });
          } catch (e) {
            log('error decoding project: $e');
          }
        });
      } catch (e) {
        log('error reading file: $e');
      }
    });
  }

  _saveProject() {
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
        var json = jsonEncode(_project.toJson());

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
