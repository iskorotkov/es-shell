class NameGenerator {
  String generate(String prefix, List<String> takenNames) {
    var i = 1;
    while (true) {
      var name = '$prefix ${takenNames.length + i}';
      if (!takenNames.contains(name)) {
        return name;
      }

      i++;
    }
  }
}
