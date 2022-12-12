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

  /// `AVALIABLE PLACES`
  String get title {
    return Intl.message(
      'AVALIABLE PLACES',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Full Capacity`
  String get fullCapacity {
    return Intl.message(
      'Full Capacity',
      name: 'fullCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Allowed Entry`
  String get allowedEntry {
    return Intl.message(
      'Allowed Entry',
      name: 'allowedEntry',
      desc: '',
      args: [],
    );
  }

  /// ` No Entry`
  String get noEntry {
    return Intl.message(
      ' No Entry',
      name: 'noEntry',
      desc: '',
      args: [],
    );
  }

  /// `place`
  String get place {
    return Intl.message(
      'place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `places`
  String get places {
    return Intl.message(
      'places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `Into`
  String get into {
    return Intl.message(
      'Into',
      name: 'into',
      desc: '',
      args: [],
    );
  }

  /// `Out`
  String get out {
    return Intl.message(
      'Out',
      name: 'out',
      desc: '',
      args: [],
    );
  }

  /// `Capacity`
  String get capacity {
    return Intl.message(
      'Capacity',
      name: 'capacity',
      desc: '',
      args: [],
    );
  }

  /// `Occupants`
  String get occupants {
    return Intl.message(
      'Occupants',
      name: 'occupants',
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
      Locale.fromSubtags(languageCode: 'pt'),
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
