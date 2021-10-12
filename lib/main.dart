import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'ES Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'ES Shell'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Rules'),
              Tab(text: 'Variables'),
              Tab(text: 'Domains'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RulesView(),
            VariablesView(),
            DomainsView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
