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
                onPressed: () {
                  log('running infer engine');

                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return ChangeNotifierProvider<Project>.value(
                        value: _project,
                        child: const InferView(),
                      );
                    },
                  ));
                },
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
