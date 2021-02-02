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

  /* //TODO: To continue.
  List<T> $copyWithin(int target, int start, int? end) {
    return this;
  } */
}
