typedef GetKey = String Function(dynamic item);

String _defaultGetKey(dynamic item) => item.toString();

class BinarySearchOccurrences {
  static int _firstOccurrence<T>(
      List<T> items, String pattern, GetKey getKey, int start, int finish) {
    if (start == finish) {
      if (getKey(items[start]).toLowerCase().startsWith(pattern)) {
        return start;
      }
      return -1;
    }

    int middle = ((start + finish) / 2).floor();
    final middleItem = getKey(items[middle]).toLowerCase();
    if (middleItem.startsWith(pattern)) {
      return _firstOccurrence<T>(items, pattern, getKey, start, middle);
    }
    if (middleItem.compareTo(pattern) == -1) {
      return _firstOccurrence<T>(items, pattern, getKey, middle + 1, finish);
    }
    return _firstOccurrence<T>(items, pattern, getKey, start, middle);
  }

  static int _lastOccurrence<T>(
      List<T> items, String pattern, GetKey getKey, int start, int finish) {
    bool twoEl = finish - start == 1;
    if (twoEl) {
      if (getKey(items[finish]).toLowerCase().startsWith(pattern)) {
        return finish;
      }
    }
    if (start == finish || twoEl) {
      if (getKey(items[start]).toLowerCase().startsWith(pattern)) {
        return start;
      }
      return -1;
    }

    int middle = ((start + finish) / 2).floor();
    final middleItem = getKey(items[middle]).toLowerCase();
    if (middleItem.startsWith(pattern)) {
      return _lastOccurrence<T>(items, pattern, getKey, middle, finish);
    }
    if (middleItem.compareTo(pattern) == -1) {
      return _lastOccurrence<T>(items, pattern, getKey, middle + 1, finish);
    }
    return _lastOccurrence<T>(items, pattern, getKey, start, middle);
  }

  static (int, int) searchIndexes<T>(List<T> items, String pattern,
      {GetKey getKey = _defaultGetKey}) {
    final patternLower = pattern.toLowerCase();
    final length = items.length - 1;
    int first = _firstOccurrence<T>(items, patternLower, getKey, 0, length);
    if (first != -1) {
      int last = _lastOccurrence<T>(items, patternLower, getKey, first, length);
      return (first, last);
    }
    return (-1, -1);
  }

  static List<T> search<T>(List<T> items, String pattern,
      {GetKey getKey = _defaultGetKey}) {
    final (first, last) = searchIndexes<T>(items, pattern, getKey: getKey);
    if (first != -1) {
      return items.sublist(first, last + 1);
    }
    return [];
  }
}
