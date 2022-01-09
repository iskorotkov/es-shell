import 'package:flutter/material.dart';

import '../sample_project.dart';
import '../utils/read_only_lock.dart';
import 'homepage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ES Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        project: createSampleProject(),
        tabContext: TabContext(),
        readOnlyLock: ReadOnlyLock(true),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
