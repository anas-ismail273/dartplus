import 'dart:math';

List<T> copyWithin$<T>(List<T> mainArr, int target, int start, [int end]) {
  ArgumentError.checkNotNull(target);
  ArgumentError.checkNotNull(start);

  end ??= mainArr.length;

  var to = target < 0 ? max(mainArr.length + target, 0) : min(target, mainArr.length);
  var from = start < 0 ? max(mainArr.length + start, 0) : min(start, mainArr.length);
  var last = end < 0 ? max(mainArr.length + end, 0) : min(end, mainArr.length);

  var count = min(last - from, mainArr.length - to);
  var direction = 1;

  if (from < to && to < (from + count)) {
    direction = -1;
    from += count - 1;
    to += count - 1;
  }

  while (count > 0) {
    if (mainArr.asMap().containsKey(from)) {
      mainArr[to] = mainArr[from];
    } else {
      mainArr.removeAt(to);
    }

    from += direction;
    to += direction;
    count--;
  }

  return mainArr;
}
