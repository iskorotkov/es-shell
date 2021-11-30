import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:es_shell/model/variable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/project.dart';
import 'sample_project.dart';
import 'widgets/editor/domains_view.dart';
import 'widgets/editor/rules_view.dart';
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
      home: const HomePage(title: 'ES Shell'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Project _project = createSampleProject();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Project>.value(
      value: _project,
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
              IconButton(
                icon: const Icon(Icons.save_alt),
                onPressed: _saveProject,
              ),
              IconButton(
                icon: const Icon(Icons.open_in_browser),
                onPressed: _loadProject,
              ),
              IconButton(
                icon: const Icon(Icons.fast_forward),
                onPressed: () => _infer(context),
              ),
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonFormField(
                    onChanged: (value) {
                      _project.target = value as Variable? ?? _project.target;
                    },
                    value: _project.target,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                        ),
                    dropdownColor: Theme.of(context).primaryColor,
                    items: _project.variables
                        .map((e) => DropdownMenuItem(
                              key: Key(e.uuid),
                              value: e,
                              child: Text(e.name),
                            ))
                        .toList(),
                  ),
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

  void _loadProject() {
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
            setState(() {
              _project = Project.fromJson(jsonDecode(value));
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

  void _saveProject() {
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
}
