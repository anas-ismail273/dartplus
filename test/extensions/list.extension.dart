import 'package:dartplus/dartplus.dart';
import 'package:test/test.dart';

void runListTests() {
  copyToTests();
  copyWithinTests();
}

void copyToTests() {
  group('list-extensions-copyTo', () {
    test('source.copyTo(target)', () {
      final source = [10, 20, 30];
      final target = [1, 2, 3, 4, 5];

      expect(source.copyTo(target), equals([10, 20, 30, 4, 5]));
    });

    test('source.copyTo(target, 1)', () {
      final source = [10, 20, 30];
      final target = [1, 2, 3, 4, 5];

      expect(source.copyTo(target, 1), equals([1, 10, 20, 30, 5]));
    });

    test('source.copyTo(target, 1, 1)', () {
      final source = [10, 20, 30];
      final target = [1, 2, 3, 4, 5];

      expect(source.copyTo(target, 1, 1), equals([1, 20, 30, 4, 5]));
    });

    test('source.copyTo(target, 1, 1, 2)', () {
      final source = [10, 20, 30];
      final target = [1, 2, 3, 4, 5];

      expect(source.copyTo(target, 1, 1, 2), equals([1, 20, 3, 4, 5]));
    });
  });
}

void copyWithinTests() {
  group('list-extensions-copyWithin', () {
    test('copyWithin(0, 3)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, 3), equals([4, 5, 3, 4, 5]));
    });
    test('copyWithin(0, 3, 4)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, 3, 4), equals([4, 2, 3, 4, 5]));
    });
    test('copyWithin(0, -2, -1)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, -2, -1), equals([4, 2, 3, 4, 5]));
    });

    test('copyWithin(2, 0)', () {
      expect([1, 2, 3, 4, 5].copyWithin(2, 0), equals([1, 2, 1, 2, 3]));
    });

    test('copyWithin(2, 3)', () {
      expect([1, 2, 3, 4, 5].copyWithin(2, 3), equals([1, 2, 4, 5, 5]));
    });
  });
}
