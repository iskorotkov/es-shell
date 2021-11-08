import 'package:flutter/foundation.dart';

import 'data_type.dart';

class Domain with ChangeNotifier {
  String name;
  String description;
  DataType dataType;
  List<Object> values = [];

  Domain({
    required this.name,
    required this.description,
    required this.dataType,
    required this.values,
  });
}
