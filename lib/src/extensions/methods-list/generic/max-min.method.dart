List<T> max$<T>(List<T> mainArr, Comparator<T> comparator, {bool all = false}) {
  ArgumentError.checkNotNull(comparator);

  if (mainArr.isEmpty) return null;

  final maxValue = mainArr.reduce(
    (curr, next) => comparator(curr, next) > 0 ? curr : next,
  );

  if (all == false) {
    return [maxValue];
  } else {
    final arr = <T>[];

    mainArr.forEach((value) {
      final result = comparator(value, maxValue);

      if (result == 0) arr.add(value);
    });

    return arr;
  }
}

List<T> min$<T>(List<T> mainArr, Comparator<T> comparator, {bool all = false}) {
  ArgumentError.checkNotNull(comparator);

  if (mainArr.isEmpty) return null;

  final minValue = mainArr.reduce(
    (curr, next) => comparator(curr, next) < 0 ? curr : next,
  );

  if (all == false) {
    return [minValue];
  } else {
    final arr = <T>[];

    mainArr.forEach((value) {
      final result = comparator(value, minValue);

      if (result == 0) arr.add(value);
    });

    return arr;
  }
}
