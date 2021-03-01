import 'dart:math';

import 'index!.fn.dart';

/// Gets index range of part of array.
///
/// @param [array] - an array
///
/// @param [startIndex] - start index (-ve: from right)
///
/// @param [endIndex] - end index (-ve: from right)
///
/// @returns - [start index, end index]

List<int> indexRange<T>(List<T> array, [int startIndex = 0, int endIndex]) {
  endIndex ??= array.length;
  startIndex = index(array, startIndex);
  endIndex = max(startIndex, index(array, endIndex));
  return [startIndex, endIndex];
}
