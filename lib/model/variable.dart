import 'domain.dart';
import 'data_type.dart';

class Variable {
  String name;
  String description;
  DataType dataType;
  Domain? domain;

  Variable({
    required this.name,
    required this.description,
    required this.dataType,
    this.domain,
  });
}
