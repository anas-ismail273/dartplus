T pop$<T>(List<T> mainArr, {T Function() onError}) {
  try {
    return mainArr.removeLast();
  } catch (_) {
    if (onError == null) {
      rethrow;
    } else {
      return onError();
    }
  }
}
