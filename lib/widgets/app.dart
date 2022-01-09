import 'package:flutter/material.dart';

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
      home: HomePage(title: 'ES Shell'),
      debugShowCheckedModeBanner: false,
    );
  }
}
