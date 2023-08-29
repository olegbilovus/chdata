import 'dart:io';

import 'package:chdata/models/mob.dart';
import 'package:chdata/service/search/constants.dart';
import 'package:chdata/service/search/hive_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // handle path_provider
  const dir = './test';
  const channel = MethodChannel(
    'plugins.flutter.io/path_provider',
  );
  handler(MethodCall methodCall) async {
    return dir;
  }

  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, handler);

  group('Hive Provider', () {
    final provider = HiveProvider();
    const key = 'prot';
    const completeKey = 'Proteus Prime~103028';

    setUp(() => provider.init());

    test('Init', () async {
      expect(() async {
        await provider.init();
      }, returnsNormally);
      await Future.delayed(const Duration(seconds: 2));
      expect(Directory('$dir/$assetsDir').existsSync(), true);
    });

    test('Search', () async {
      final result =
          await provider.search<Mob>(database: mobListField, key: key);
      expect(result.isNotEmpty, true);
    });

    test('Search contains', () async {
      final result = await provider.search<Mob>(
          database: mobListField, key: key, contains: true);
      expect(result.isNotEmpty, true);
      expect(result.first.key.toLowerCase().contains(key), true);
    });

    test('Search retrieve', () async {
      final result = await provider.search<Mob>(
          database: mobListField, key: key, retrieve: true);
      expect(result.isNotEmpty, true);
      expect(result.first.data is Mob, true);
    });

    test('Search contains retrieve', () async {
      final result = await provider.search<Mob>(
          database: mobListField, key: key, contains: true, retrieve: true);
      expect(result.isNotEmpty, true);
      expect(result.first.data is Mob, true);
    });

    test('Search empty string', () async {
      final result = await provider.search<Mob>(
          database: mobListField, key: '', retrieve: true);
      expect(result.isNotEmpty, true);
      expect(result.first.data is Mob, true);
    });

    test('Search One', () async {
      final result = await provider.searchOne<Mob>(
          database: mobListField, key: completeKey);
      expect(result, isNotNull);
      expect(result.key.isNotEmpty, true);
      expect(result.data, isNotNull);
    });
  });
}
