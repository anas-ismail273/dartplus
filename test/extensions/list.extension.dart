import 'package:dartplus/dartplus.dart';
import 'package:test/test.dart';

void runListTests() {
  copyWithinTests();
}

void copyWithinTests() {
  group('list-extensions-copyWithin: [1, 2, 3, 4, 5]', () {
    test('.copyWithin(0, 3)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, 3), equals([4, 5, 3, 4, 5]));
    });
    test('.copyWithin(0, 3, 4)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, 3, 4), equals([4, 2, 3, 4, 5]));
    });
    test('.copyWithin(0, -2, -1)', () {
      expect([1, 2, 3, 4, 5].copyWithin(0, -2, -1), equals([4, 2, 3, 4, 5]));
    });

    test('.copyWithin(2, 0)', () {
      expect([1, 2, 3, 4, 5].copyWithin(2, 0), equals([1, 2, 1, 2, 3]));
    });

    test('.copyWithin(2, 3)', () {
      expect([1, 2, 3, 4, 5].copyWithin(2, 3), equals([1, 2, 4, 5, 5]));
    });
  });
}
