import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, dynamic>> _localizedValues = {
    // List of all Strings...
    'de': {
      'title': 'Running Trainer',
      'newRun': 'Neuer Lauf',
      'newTraining': 'Neues Training',
      'lastRuns': 'Letzten Läufe',
      'lastWeek': 'Letzte Woche',
      'lastMonth': 'Letzter Monat',
      'minutes': 'Minuten (min)',
      'distance': 'Distanz (km)',
      'setTimeAim': 'Klicke zum setzen deines Zeitziels',
      'setDistanceAim': 'Klicke zum setze deines Distanzziels',
      'distancePerMonth': 'Distanz (km) pro Monat',
      'distancePerWeek': 'Distanz (km) pro Woche',
      'timePerMonth': 'Zeit (min) pro Monat',
      'timePerWeek': 'Zeit (min) pro Woche',
      'startRun': 'Lauf starten',
      'accuracy': 'Genauigkeit',
      'route': 'Route',
      'name': 'Name',
      'setName': 'Benenne die Strecke oder wähle eine alte aus:',
      'or': 'oder',
      'newRoute': 'Neu route',
      'lastRoutes': 'Alte Route'
    },
    'en': {
      'title': 'Running Trainer',
      'newRun': 'New run',
      'newTraining': 'New training',
      'lastRuns': 'Last runs',
      'lastWeek': 'Last week',
      'lastMonth': 'Last month',
      'minutes': 'Minutes (min)',
      'distance': 'Distance (km)',
      'setTimeAim': 'Click to setup your time aim',
      'setDistanceAim': 'Click to setup your distance aim',
      'distancePerMonth': 'Distance (km) per month',
      'distancePerWeek': 'Distance (km) per week',
      'timePerMonth': 'Time (min) per month',
      'timePerWeek': 'Time (min) per week',
      'startRun': 'Start run',
      'accuracy': 'Accuracy',
      'route': 'Route',
      'name': 'Name',
      'setName': 'Name the track or select an old one:',
      'or': 'or',
      'newRoute': 'New route',
      'lastRoutes': 'Old route',
    }
  };
  // All getters
  // ignore: public_member_api_docs
  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  // ignore: public_member_api_docs
  String get newRun {
    return _localizedValues[locale.languageCode]['newRun'];
  }

  // ignore: public_member_api_docs
  String get newTraining {
    return _localizedValues[locale.languageCode]['newTraining'];
  }

  // ignore: public_member_api_docs
  String get lastRuns {
    return _localizedValues[locale.languageCode]['lastRuns'];
  }

  // ignore: public_member_api_docs
  String get lastWeek {
    return _localizedValues[locale.languageCode]['lastWeek'];
  }

  // ignore: public_member_api_docs
  String get lastMonth {
    return _localizedValues[locale.languageCode]['lastMonth'];
  }

  // ignore: public_member_api_docs
  String get minutes {
    return _localizedValues[locale.languageCode]['minutes'];
  }

  // ignore: public_member_api_docs
  String get distance {
    return _localizedValues[locale.languageCode]['distance'];
  }

  // ignore: public_member_api_docs
  String get setTimeAim {
    return _localizedValues[locale.languageCode]['setTimeAim'];
  }

  // ignore: public_member_api_docs
  String get setDistanceAim {
    return _localizedValues[locale.languageCode]['setDistanceAim'];
  }

  // ignore: public_member_api_docs
  String get distancePerMonth {
    return _localizedValues[locale.languageCode]['distancePerMonth'];
  }

  // ignore: public_member_api_docs
  String get distancePerWeek {
    return _localizedValues[locale.languageCode]['distancePerWeek'];
  }

  // ignore: public_member_api_docs
  String get timePerMonth {
    return _localizedValues[locale.languageCode]['timePerMonth'];
  }

  // ignore: public_member_api_docs
  String get timePerWeek {
    return _localizedValues[locale.languageCode]['timePerWeek'];
  }

  // ignore: public_member_api_docs
  String get startRun {
    return _localizedValues[locale.languageCode]['startRun'];
  }

  // ignore: public_member_api_docs
  String get accuracy {
    return _localizedValues[locale.languageCode]['accuracy'];
  }

  // ignore: public_member_api_docs
  String get route {
    return _localizedValues[locale.languageCode]['route'];
  }

  // ignore: public_member_api_docs
  String get name {
    return _localizedValues[locale.languageCode]['name'];
  }

  // ignore: public_member_api_docs
  String get setName {
    return _localizedValues[locale.languageCode]['setName'];
  }

  // ignore: public_member_api_docs
  String get or {
    return _localizedValues[locale.languageCode]['or'];
  }

  // ignore: public_member_api_docs
  String get newRoute {
    return _localizedValues[locale.languageCode]['newRoute'];
  }

  // ignore: public_member_api_docs
  String get lastRoutes {
    return _localizedValues[locale.languageCode]['lastRoutes'];
  }
  // end all getters
}
// ignore: public_member_api_docs
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // ignore: public_member_api_docs
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['de', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}