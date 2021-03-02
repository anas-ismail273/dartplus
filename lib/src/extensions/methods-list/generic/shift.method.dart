T shift$<T>(List<T> mainArr, {T Function() onError}) {
  try {
    return mainArr.removeAt(0);
  } catch (_) {
    if (onError == null) {
      rethrow;
    } else {
      return onError();
    }
  }
}
