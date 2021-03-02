int unshift$<T>(List<T> mainrArr, List<T> items) {
  ArgumentError.checkNotNull(items);

  for (var i = items.length - 1; i >= 0; i--) {
    mainrArr.insert(0, items[i]);
  }

  return mainrArr.length;
}
