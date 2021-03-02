import 'dart:core';

import 'methods-list/generic/methods.index.dart';

extension ListExtension<T> on List<T> {
  int unshift(List<T> items) {
    return unshift$(this, items);
  }

  T shift({T Function() onError}) {
    return shift$(this, onError: onError);
  }

  T pop({T Function() onError}) {
    return pop$(this, onError: onError);
  }

  void forEachIndexed(void Function(T item, int index) callbackfn) {
    return forEachIndexed$(this, callbackfn);
  }

  T at(int index, {T Function() onError}) {
    return at$(this, index, onError: onError);
  }

  List<T> concat(List<List<T>> arrays) {
    return concat$(this, arrays);
  }

  /// Copies part of array to another.
  ///
  /// @param [target] - target array (updated)
  ///
  /// @param [writeIndex] - write index
  ///
  /// @param [readStartIndex] - read start index
  ///
  /// @param [readEndIndex] - read end index
  ///
  /// @returns - [target]

  List<T> copyTo(
    List<T> target, [
    int writeIndex = 0,
    int readStartIndex = 0,
    int readEndIndex,
  ]) {
    return copyTo$(this, target, writeIndex, readStartIndex, readEndIndex);
  }

  List<T> copyWithin(int target, int start, [int end]) {
    return copyWithin$(this, target, start, end);
  }

  List<T> slice(int start, [int end]) {
    return slice$(this, start, end);
  }

  List<T> splice(int start, [int deleteCount, List<T> items]) {
    return splice$(this, start, deleteCount, items);
  }

  List<T> max(Comparator<T> comparator, {bool all = false}) {
    return max$(this, comparator, all: all);
  }

  List<T> min(Comparator<T> comparator, {bool all = false}) {
    return min$(this, comparator, all: all);
  }
}
