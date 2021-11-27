enum VariableType {
  inferred,
  prompted,
  inferredThenPrompted,
  promptedThenInferred,
}

extension VariableTypeFormatting on VariableType {
  String name() => toString().split(".").last;
}
