import 'package:dartplus/src/utils/functions/list/fns.index.dart';

List<T> copyTo$<T>(
  List<T> mainArr,
  List<T> target, [
  int writeIndex = 0,
  int readStartIndex = 0,
  int readEndIndex,
]) {
  ArgumentError.checkNotNull(target);

  readEndIndex ??= mainArr.length;

  writeIndex = index(target, writeIndex);
  var result = indexRange(mainArr, readStartIndex, readEndIndex);

  readStartIndex = result[0];
  readEndIndex = result[1];

  for (; readStartIndex < readEndIndex; readStartIndex++, writeIndex++) {
    target[writeIndex] = mainArr[readStartIndex];
  }

  return target;
}
