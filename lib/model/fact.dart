import 'package:flutter/foundation.dart';

import 'variable.dart';

class Fact with ChangeNotifier {
  Variable variable;
  Object value;

  Fact({
    required this.variable,
    required this.value,
  });
}
