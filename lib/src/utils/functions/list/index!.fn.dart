import 'dart:math';

/// Gets zero-based index.
///
/// @param [array] - an array
///
/// @param [index] - index (-ve: from right)

int index<T>(List<T> array, [int index = 0]) {
  return index < 0 ? max(array.length + index, 0) : min(index, array.length);
}
