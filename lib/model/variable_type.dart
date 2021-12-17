enum VariableType {
  inferred,
  prompted,
  inferredThenPrompted,
  promptedThenInferred,
}

extension VariableTypeFormatting on VariableType {
  String uiName() {
    switch (this) {
      case VariableType.inferredThenPrompted:
        return "inferred, then prompted";
      case VariableType.promptedThenInferred:
        return "prompted, then inferred";
      default:
        return toString().split(".").last;
    }
  }
}
