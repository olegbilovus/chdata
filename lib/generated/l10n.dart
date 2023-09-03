// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CH DATA`
  String get app_title {
    return Intl.message(
      'CH DATA',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get dialog_loading {
    return Intl.message(
      'Loading',
      name: 'dialog_loading',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_search {
    return Intl.message(
      'Search',
      name: 'search_search',
      desc: '',
      args: [],
    );
  }

  /// `Filtering any character`
  String get search_contains {
    return Intl.message(
      'Filtering any character',
      name: 'search_contains',
      desc: '',
      args: [],
    );
  }

  /// `Filtering the first characters`
  String get search_not_contains {
    return Intl.message(
      'Filtering the first characters',
      name: 'search_not_contains',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get search_empty {
    return Intl.message(
      'Not found',
      name: 'search_empty',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get mob_level {
    return Intl.message(
      'Level',
      name: 'mob_level',
      desc: '',
      args: [],
    );
  }

  /// `Mob opinion`
  String get mob_mobOpinion {
    return Intl.message(
      'Mob opinion',
      name: 'mob_mobOpinion',
      desc: '',
      args: [],
    );
  }

  /// `Base stats`
  String get mob_baseStats {
    return Intl.message(
      'Base stats',
      name: 'mob_baseStats',
      desc: '',
      args: [],
    );
  }

  /// `Stars`
  String get mob_stars {
    return Intl.message(
      'Stars',
      name: 'mob_stars',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get mob_health {
    return Intl.message(
      'Health',
      name: 'mob_health',
      desc: '',
      args: [],
    );
  }

  /// `Energy`
  String get mob_energy {
    return Intl.message(
      'Energy',
      name: 'mob_energy',
      desc: '',
      args: [],
    );
  }

  /// `Attack`
  String get mob_attack {
    return Intl.message(
      'Attack',
      name: 'mob_attack',
      desc: '',
      args: [],
    );
  }

  /// `Defence`
  String get mob_defence {
    return Intl.message(
      'Defence',
      name: 'mob_defence',
      desc: '',
      args: [],
    );
  }

  /// `XP`
  String get mob_xp {
    return Intl.message(
      'XP',
      name: 'mob_xp',
      desc: '',
      args: [],
    );
  }

  /// `Aggro range`
  String get mob_aggroRange {
    return Intl.message(
      'Aggro range',
      name: 'mob_aggroRange',
      desc: '',
      args: [],
    );
  }

  /// `Follow range`
  String get mob_followRange {
    return Intl.message(
      'Follow range',
      name: 'mob_followRange',
      desc: '',
      args: [],
    );
  }

  /// `Attack range`
  String get mob_AttackRange {
    return Intl.message(
      'Attack range',
      name: 'mob_AttackRange',
      desc: '',
      args: [],
    );
  }

  /// `Attack speed`
  String get mob_attackSpeed {
    return Intl.message(
      'Attack speed',
      name: 'mob_attackSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Missile speed`
  String get mob_missileSpeed {
    return Intl.message(
      'Missile speed',
      name: 'mob_missileSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Gold min`
  String get mob_goldMin {
    return Intl.message(
      'Gold min',
      name: 'mob_goldMin',
      desc: '',
      args: [],
    );
  }

  /// `Gold max`
  String get mob_goldMax {
    return Intl.message(
      'Gold max',
      name: 'mob_goldMax',
      desc: '',
      args: [],
    );
  }

  /// `Damage`
  String get mob_damage {
    return Intl.message(
      'Damage',
      name: 'mob_damage',
      desc: '',
      args: [],
    );
  }

  /// `Pierce`
  String get mob_pierce {
    return Intl.message(
      'Pierce',
      name: 'mob_pierce',
      desc: '',
      args: [],
    );
  }

  /// `Slash`
  String get mob_slash {
    return Intl.message(
      'Slash',
      name: 'mob_slash',
      desc: '',
      args: [],
    );
  }

  /// `Crush`
  String get mob_crush {
    return Intl.message(
      'Crush',
      name: 'mob_crush',
      desc: '',
      args: [],
    );
  }

  /// `Poison`
  String get mob_poison {
    return Intl.message(
      'Poison',
      name: 'mob_poison',
      desc: '',
      args: [],
    );
  }

  /// `True`
  String get mob_true {
    return Intl.message(
      'True',
      name: 'mob_true',
      desc: '',
      args: [],
    );
  }

  /// `Heat`
  String get mob_heat {
    return Intl.message(
      'Heat',
      name: 'mob_heat',
      desc: '',
      args: [],
    );
  }

  /// `Cold`
  String get mob_cold {
    return Intl.message(
      'Cold',
      name: 'mob_cold',
      desc: '',
      args: [],
    );
  }

  /// `Magic`
  String get mob_magic {
    return Intl.message(
      'Magic',
      name: 'mob_magic',
      desc: '',
      args: [],
    );
  }

  /// `Divine`
  String get mob_divine {
    return Intl.message(
      'Divine',
      name: 'mob_divine',
      desc: '',
      args: [],
    );
  }

  /// `Chaos`
  String get mob_chaos {
    return Intl.message(
      'Chaos',
      name: 'mob_chaos',
      desc: '',
      args: [],
    );
  }

  /// `Resistance`
  String get mob_resistance {
    return Intl.message(
      'Resistance',
      name: 'mob_resistance',
      desc: '',
      args: [],
    );
  }

  /// `Fishing`
  String get mob_fishing {
    return Intl.message(
      'Fishing',
      name: 'mob_fishing',
      desc: '',
      args: [],
    );
  }

  /// `Fishing damage`
  String get mob_fishingDamage {
    return Intl.message(
      'Fishing damage',
      name: 'mob_fishingDamage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
