List<T> splice$<T>(List<T> mainArr, int start, [int deleteCount, List<T> items]) {
  ArgumentError.checkNotNull(start);

  final targetedArr = mainArr;
  final resultArr = <T>[];

  if (start > targetedArr.length) {
    start = targetedArr.length;
    if (items != null) {
      targetedArr.insertAll(start, items);
      return [];
    }
  } else if (start < 0) {
    start = 0;
  }

  if (deleteCount == null || deleteCount >= targetedArr.length - start) {
    for (var i = start; i < targetedArr.length; ++i) {
      resultArr.add(targetedArr[i]);
    }
    targetedArr.removeRange(start, targetedArr.length);
    if (items != null) {
      targetedArr.insertAll(start, items);
    }
    return resultArr;
  }

  if (deleteCount <= 0) {
    if (items != null) {
      targetedArr.insertAll(start, items);
    }
    return [];
  }
  for (var i = start; i < start + deleteCount; ++i) {
    resultArr.add(targetedArr[i]);
  }
  targetedArr.removeRange(start, start + deleteCount);
  if (items != null) {
    targetedArr.insertAll(start, items);
  }
  return resultArr;
}
