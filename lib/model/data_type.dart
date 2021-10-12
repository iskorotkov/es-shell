enum DataType {
  string,
  int,
}

extension DataTypeFormatting on DataType {
  String name() => toString().split(".").last;
}
