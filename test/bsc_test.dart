import 'package:chdata/utilities/alg/binary_search_occurrences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BinarySearchOccurrences', () {
    final items = [
      'a',
      'air',
      'airport',
      'airport',
      'code',
      'coding',
      'dev',
      'soft',
      'software'
    ];

    const notExistingItem = 'test';
    test('Not empty return', () {
      final result = BinarySearchOccurrences.search<String>(items, 'air');
      expect(listEquals(result, items.sublist(1, 4)), true);
    });

    test('Empty return', () {
      final result =
          BinarySearchOccurrences.search<String>(items, notExistingItem);
      expect(listEquals(result, []), true);
    });

    test('Correct indexes', () {
      final result =
          BinarySearchOccurrences.searchIndexes<String>(items, 'air');
      expect(result, (1, 3));
    });

    test('Empty indexes', () {
      final result =
          BinarySearchOccurrences.searchIndexes<String>(items, notExistingItem);
      expect(result, (-1, -1));
    });

    test('Empty string', () {
      final result = BinarySearchOccurrences.search<String>(items, '');
      expect(listEquals(result, items), true);
    });
  });

  group('BinarySearchOccurrences GetKey', () {
    const items = [
      ItemObj(ItemObj2('a')),
      ItemObj(ItemObj2('air')),
      ItemObj(ItemObj2('airport')),
      ItemObj(ItemObj2('airport')),
      ItemObj(ItemObj2('code')),
      ItemObj(ItemObj2('coding')),
      ItemObj(ItemObj2('dev')),
      ItemObj(ItemObj2('soft')),
      ItemObj(ItemObj2('software'))
    ];

    const notExistingItem = ItemObj(ItemObj2('test'));

    test('Not empty return', () {
      final result =
          BinarySearchOccurrences.search<ItemObj>(items, 'air', getKey: getKey);
      expect(listEquals(result, items.sublist(1, 4)), true);
    });

    test('Empty return', () {
      final result = BinarySearchOccurrences.search<ItemObj>(
          items, getKey(notExistingItem),
          getKey: getKey);
      expect(listEquals(result, []), true);
    });

    test('Correct indexes', () {
      final result = BinarySearchOccurrences.searchIndexes<ItemObj>(
          items, 'air',
          getKey: getKey);
      expect(result, (1, 3));
    });

    test('Empty indexes', () {
      final result = BinarySearchOccurrences.searchIndexes<ItemObj>(
          items, getKey(notExistingItem));
      expect(result, (-1, -1));
    });

    test('Empty string', () {
      final result =
          BinarySearchOccurrences.search<ItemObj>(items, '', getKey: getKey);
      expect(listEquals(result, items), true);
    });
  });
}

class ItemObj {
  final ItemObj2 obj2;

  const ItemObj(this.obj2);
}

class ItemObj2 {
  final String str;

  const ItemObj2(this.str);
}

String getKey(dynamic obj) => obj.obj2.str;
