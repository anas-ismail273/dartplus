T at$<T>(List<T> mainArr, int index, {T Function() onError}) {
  ArgumentError.checkNotNull(index);

  try {
    if (mainArr.isEmpty) {
      throw RangeError('Valid value range is empty');
    }

    return index >= 0 ? mainArr.elementAt(index) : mainArr[mainArr.length - (index.abs())];
  } catch (_) {
    if (onError == null) {
      rethrow;
    } else {
      return onError();
    }
  }
}
