import 'dart:core';

extension ListExtension<T> on List<T> {
  int unshift(List<T> items) {
    for (var i = items.length - 1; i >= 0; i--) {
      insert(0, items[i]);
    }

    return length;
  }

  T shift({T Function() onError}) {
    try {
      return removeAt(0);
    } catch (e) {
      return onError == null ? e : onError();
    }
  }

  int push(List<T> items) {
    addAll(items);
    return length;
  }

  T pop({T Function() onError}) {
    return removeLast();
    /* try {

    } catch (e) {
      return onError == null ? e : onError();
    } */
  }

  void forEachIndexed(
    void Function(T item, int index, List<T> array) callbackfn,
  ) {
    final l = length;

    for (var index = 0; index < l; index += 1) {
      final value = this[index];
      callbackfn(value, index, this);
    }
  }

  T at(int index) {
    if (length == 0) {
      throw RangeError('Valid value range is empty');
    } else if (index < 0) {
      return elementAt(index);
    } else {
      return this[length - (1 + index.abs())];
    }
  }

  List<T> concat(List<List<T>> arrays) {
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
  /* //TODO: To continue.
  List<T> $copyWithin(int target, int start, int? end) {
    return this;
  } */
}
