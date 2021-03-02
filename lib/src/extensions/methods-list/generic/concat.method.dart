List<T> concat$<T>(List<T> mainArr, List<List<T>> arrays) {
  ArgumentError.checkNotNull(arrays);

  var temp = mainArr;

  arrays.forEach((array) => temp += array);

  return temp;
}
