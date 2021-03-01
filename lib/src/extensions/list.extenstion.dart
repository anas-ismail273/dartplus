import 'dart:core';
import 'dart:math';

extension ListExtension<T> on List<T> {
  int unshift(List<T> items) {
    ArgumentError.checkNotNull(items);

    for (var i = items.length - 1; i >= 0; i--) {
      insert(0, items[i]);
    }

    return length;
  }

  T shift({T Function() onError}) {
    try {
      return removeAt(0);
    } catch (_) {
      if (onError == null) {
        rethrow;
      } else {
        return onError();
      }
    }
  }

  T pop({T Function() onError}) {
    try {
      return removeLast();
    } catch (_) {
      if (onError == null) {
        rethrow;
      } else {
        return onError();
      }
    }
  }

  void forEachIndexed(
    void Function(T item, int index) callbackfn,
  ) {
    ArgumentError.checkNotNull(callbackfn);

    final l = length;

    for (var index = 0; index < l; index += 1) {
      final value = this[index];
      callbackfn(value, index);
    }
  }

  T at(int index, {T Function() onError}) {
    ArgumentError.checkNotNull(index);

    try {
      if (length == 0) {
        throw RangeError('Valid value range is empty');
      }

      return index >= 0 ? elementAt(index) : this[length - (index.abs())];
    } catch (_) {
      if (onError == null) {
        rethrow;
      } else {
        return onError();
      }
    }
  }

  List<T> concat(List<List<T>> arrays) {
    ArgumentError.checkNotNull(arrays);

    var temp = this;

    arrays.forEach((array) => temp += array);

    return temp;
  }

  List<T> reverse() => List.from(reversed);

  List<T> copyWithin(int target, int start, [int end]) {
    ArgumentError.checkNotNull(target);
    ArgumentError.checkNotNull(start);

    end ??= length;

    var to = target < 0 ? max(length + target, 0) : min(target, length);
    var from = start < 0 ? max(length + start, 0) : min(start, length);
    var last = end < 0 ? max(length + end, 0) : min(end, length);
    var count = min(last - from, length - to);
    var direction = 1;

    if (from < to && to < (from + count)) {
      direction = -1;
      from += count - 1;
      to += count - 1;
    }

    while (count > 0) {
      if (asMap().containsKey(from)) {
        this[to] = this[from];
      } else {
        removeAt(to);
      }

      from += direction;
      to += direction;
      count--;
    }

    return this;
  }

  List<T> slice(int start, [int end]) {
    ArgumentError.checkNotNull(start);

    final result = <T>[];

    if (end == null) {
      for (var i = start; i < length; ++i) {
        result.add(this[i]);
      }
    } else {
      for (var i = start; i < end; ++i) {
        result.add(this[i]);
      }
    }

    return result;
  }

  List<T> splice(int start, [int deleteCount, List<T> items]) {
    ArgumentError.checkNotNull(start);

    final targetedArr = this;
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
}
