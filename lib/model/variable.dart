import 'domain.dart';

class Variable {
  String name;
  String description;
  Type type;
  Domain domain;

  Variable(this.name, this.description, this.type, this.domain);
}
