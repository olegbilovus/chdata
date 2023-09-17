typedef GetKey = dynamic Function(dynamic item);
typedef Equals = bool Function(dynamic a, dynamic b);

String _defaultGetKey(dynamic item) => item.toString();

bool _defaultEquals(dynamic a, dynamic b) => a.startsWith(b);

class BinarySearchOccurrences {
  static int _firstOccurrence<T>(
    List<T> items,
    dynamic pattern,
    GetKey getKey,
    Equals equals,
    int start,
    int finish,
  ) {
    if (start == finish) {
      if (equals(getKey(items[start]).toLowerCase(), pattern)) {
        return start;
      }
      return -1;
    }

    int middle = ((start + finish) / 2).floor();
    final middleItem = getKey(items[middle]).toLowerCase();
    if (equals(middleItem, pattern)) {
      return _firstOccurrence<T>(items, pattern, getKey, equals, start, middle);
    }
    if (middleItem.compareTo(pattern) == -1) {
      return _firstOccurrence<T>(
          items, pattern, getKey, equals, middle + 1, finish);
    }
    return _firstOccurrence<T>(items, pattern, getKey, equals, start, middle);
  }

  static int _lastOccurrence<T>(
    List<T> items,
    dynamic pattern,
    GetKey getKey,
    Equals equals,
    int start,
    int finish,
  ) {
    bool twoEl = finish - start == 1;
    if (twoEl) {
      if (equals(getKey(items[finish]).toLowerCase(), pattern)) {
        return finish;
      }
    }
    if (start == finish || twoEl) {
      if (equals(getKey(items[start]).toLowerCase(), pattern)) {
        return start;
      }
      return -1;
    }

    int middle = ((start + finish) / 2).floor();
    final middleItem = getKey(items[middle]).toLowerCase();
    if (middleItem.startsWith(pattern)) {
      return _lastOccurrence<T>(items, pattern, getKey, equals, middle, finish);
    }
    if (middleItem.compareTo(pattern) == -1) {
      return _lastOccurrence<T>(
          items, pattern, getKey, equals, middle + 1, finish);
    }
    return _lastOccurrence<T>(items, pattern, getKey, equals, start, middle);
  }

  static (int, int) searchIndexes<T>(List<T> items, dynamic pattern,
      {GetKey getKey = _defaultGetKey, Equals equals = _defaultEquals}) {
    final patternLower = pattern.toLowerCase();
    final length = items.length - 1;
    int first =
        _firstOccurrence<T>(items, patternLower, getKey, equals, 0, length);
    if (first != -1) {
      int last = _lastOccurrence<T>(
          items, patternLower, getKey, equals, first, length);
      return (first, last);
    }
    return (-1, -1);
  }

  static List<T> search<T>(List<T> items, dynamic pattern,
      {GetKey getKey = _defaultGetKey, Equals equals = _defaultEquals}) {
    final (first, last) = searchIndexes<T>(items, pattern, getKey: getKey);
    if (first != -1) {
      return items.sublist(first, last + 1);
    }
    return [];
  }
}
