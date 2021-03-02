List<T> slice$<T>(List<T> mainArr, int start, [int end]) {
  ArgumentError.checkNotNull(start);

  final result = <T>[];

  if (end == null) {
    for (var i = start; i < mainArr.length; ++i) {
      result.add(mainArr[i]);
    }
  } else {
    for (var i = start; i < end; ++i) {
      result.add(mainArr[i]);
    }
  }

  return result;
}
