void forEachIndexed$<T>(List<T> mainArr, void Function(T item, int index) callbackfn) {
  ArgumentError.checkNotNull(callbackfn);

  final l = mainArr.length;

  for (var index = 0; index < l; index += 1) {
    final value = mainArr[index];
    callbackfn(value, index);
  }
}
