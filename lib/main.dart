import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ES Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ES Shell'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Rules'),
              Tab(text: 'Variables'),
              Tab(text: 'Domains'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRulesView(context),
            const Center(child: Text('2')),
            const Center(child: Text('3')),
          ],
        ),
      ),
    );
  }

  ExpansionTile _buildExpandableRuleCard() {
    return const ExpansionTile(
      title: Text('123'),
      children: [
        Text('456'),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      itemCount: 20,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return _buildRuleCard(context, index);
        // return _buildExpandableRuleCard();
      },
    );
  }

  Card _buildRuleCard(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '#${index + 1}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Long description of what this rule does and how it does it',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRulesView(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildList(context)),
        SizedBox(
          width: 300,
          child: _buildToolbar(),
        )
      ],
    );
  }

  Widget _buildToolbar() {
    return Material(
      elevation: 32,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildToolbarPanel(
            context: context,
            children: [
              Text('Panel 1'),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Create'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Update'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                ),
              ),
            ],
          ),
          _buildToolbarPanel(
            context: context,
            children: const [
              Text('Panel 2'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarPanel({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
