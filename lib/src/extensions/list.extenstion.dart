import 'dart:core';

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
    void Function(T item, int index, List<T> array) callbackfn,
  ) {
    ArgumentError.checkNotNull(callbackfn);

    final l = length;

    for (var index = 0; index < l; index += 1) {
      final value = this[index];
      callbackfn(value, index, this);
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

  List<T> slice(int start, [int end]) {
    ArgumentError.checkNotNull(start);
    final resultArray = <T>[];
    final targetedArray = this;

    if (end == null) {
      for (var i = start; i < targetedArray.length; ++i) {
        resultArray.add(targetedArray[i]);
      }
    } else {
      for (var i = start; i < end; ++i) {
        resultArray.add(targetedArray[i]);
      }
    }

    return resultArray;
  }

  List<T> splice(int start, [int deleteCount, List<T> items]) {
    ArgumentError.checkNotNull(start);

    final targetedArray = this;
    final resultArray = <T>[];

    if (start > targetedArray.length) {
      start = targetedArray.length;
      if (items != null) {
        targetedArray.insertAll(start, items);
        return [];
      }
    } else if (start < 0) {
      start = 0;
    }

    if (deleteCount == null || deleteCount >= targetedArray.length - start) {
      for (var i = start; i < targetedArray.length; ++i) {
        resultArray.add(targetedArray[i]);
      }
      targetedArray.removeRange(start, targetedArray.length);
      if (items != null) {
        targetedArray.insertAll(start, items);
      }
      return resultArray;
    }

    if (deleteCount <= 0) {
      if (items != null) {
        targetedArray.insertAll(start, items);
      }
      return [];
    }
    for (var i = start; i < start + deleteCount; ++i) {
      resultArray.add(targetedArray[i]);
    }
    targetedArray.removeRange(start, start + deleteCount);
    if (items != null) {
      targetedArray.insertAll(start, items);
    }
    return resultArray;
  }
}
