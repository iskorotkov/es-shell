List<T> reorderItems<T>(List<T> items, int oldIndex, int newIndex) {
  var value = items[oldIndex];

  if (newIndex > oldIndex) {
    for (var i = oldIndex; i < newIndex - 1; i++) {
      items[i] = items[i + 1];
    }

    items[newIndex - 1] = value;
  } else {
    for (var i = oldIndex; i > newIndex; i--) {
      items[i] = items[i - 1];
    }

    items[newIndex] = value;
  }

  return items;
}
