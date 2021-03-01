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

    int fix(int index, int length) {
      return index < 0 ? max(length + index, 0) : min(length, index);
    }

    end ??= length;

    target = fix(target, length);
    start = fix(start, length);
    end = fix(end, length);

    var reverse = start > end;
    var count = (reverse ? start - end : end - start);

    while (count > 0) {
      count--;

      var from = !reverse ? start + count : end - count;
      var to = !reverse ? target + count : target - count;

      if (asMap().containsKey(from)) {
        this[to] = this[from];
      } else {
        removeAt(to);
      }
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
