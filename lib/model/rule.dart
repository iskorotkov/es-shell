import 'package:flutter/foundation.dart';

import 'fact.dart';

class Rule with ChangeNotifier {
  String name;
  String description;
  List<Fact> conditions = [];
  List<Fact> results = [];

  Rule({
    required this.name,
    required this.description,
    required this.conditions,
    required this.results,
  });
}
