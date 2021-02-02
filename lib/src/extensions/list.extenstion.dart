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
}
