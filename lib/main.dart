import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/data_type.dart';
import 'model/domain.dart';
import 'model/fact.dart';
import 'model/project.dart';
import 'model/rule.dart';
import 'model/variable.dart';
import 'widgets/domains_view.dart';
import 'widgets/rules_view.dart';
import 'widgets/variables_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var domains = <Domain>[
      Domain(
        name: 'Num domain',
        description: 'Limited values',
        dataType: DataType.int,
        values: [1, 2, 3, 7],
      )
    ];

    var variables = <Variable>[
      Variable(
        name: 'Name1',
        description: 'Desc1',
        dataType: DataType.int,
      ),
      Variable(
        name: 'Name2',
        description: 'Desc2',
        dataType: DataType.string,
      ),
      Variable(
        name: 'Name3',
        description: 'Desc3',
        dataType: DataType.int,
        domain: domains.first,
      ),
    ];

    var project = Project(
      domains: domains,
      variables: variables,
      rules: [
        Rule(
          name: 'Rule1',
          description: 'Desc1',
          conditions: [
            Fact(
              variable: variables[0],
              value: 1,
            )
          ],
          results: [
            Fact(
              variable: variables[1],
              value: 'hello',
            )
          ],
        ),
        Rule(
          name: 'Rule2',
          description: 'Desc2',
          conditions: [
            Fact(
              variable: variables[1],
              value: 'hello',
            )
          ],
          results: [
            Fact(
              variable: variables[2],
              value: 7,
            )
          ],
        ),
      ],
      target: variables.last,
    );

    return MaterialApp(
      title: 'ES Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Project>.value(
        value: project,
        child: const HomePage(title: 'ES Shell'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var project = context.watch<Project>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
              onPressed: () {
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
              },
            ),
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () {
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
                        project = Project.fromJson(jsonDecode(value));
                      } catch (e) {
                        log('error decoding project: $e');
                      }
                    });
                  } catch (e) {
                    log('error reading file: $e');
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              onPressed: () {
                log('running infer engine');
              },
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
    );
  }
}
