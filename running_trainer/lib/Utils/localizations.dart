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
      'title': 'Trackning Trainer',
      'newTrack': 'Neuer Lauf',
      'newTraining': 'Neues Training',
      'lastTracks': 'Letzten Läufe',
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
      'startTrack': 'Lauf starten',
      'accuracy': 'Genauigkeit',
      'route': 'Route',
      'name': 'Name',
      'setName': 'Benenne die Strecke oder wähle eine alte aus:',
      'or': 'oder',
      'newRoute': 'Neu route',
      'lastRoutes': 'Alte Route',
      'kmh': 'km/h',
      'min': 'min',
      'km': 'km',
      'sec': 'sec',
    },
    'en': {
      'title': 'Trackning Trainer',
      'newTrack': 'New track',
      'newTraining': 'New training',
      'lastTracks': 'Last tracks',
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
      'startTrack': 'Start track',
      'accuracy': 'Accuracy',
      'route': 'Route',
      'name': 'Name',
      'setName': 'Name the track or select an old one:',
      'or': 'or',
      'newRoute': 'New route',
      'lastRoutes': 'Old route',
      'kmh': 'km/h',
      'min': 'min',
      'km': 'km',
      'sec': 'sec',
    }
  };
  // All getters
  // ignore: public_member_api_docs
  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  // ignore: public_member_api_docs
  String get newTrack {
    return _localizedValues[locale.languageCode]['newTrack'];
  }

  // ignore: public_member_api_docs
  String get newTraining {
    return _localizedValues[locale.languageCode]['newTraining'];
  }

  // ignore: public_member_api_docs
  String get lastTracks {
    return _localizedValues[locale.languageCode]['lastTracks'];
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
  String get startTrack {
    return _localizedValues[locale.languageCode]['startTrack'];
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

  // ignore: public_member_api_docs
  String get kmh {
    return _localizedValues[locale.languageCode]['kmh'];
  }

  // ignore: public_member_api_docs
  String get min {
    return _localizedValues[locale.languageCode]['min'];
  }

  // ignore: public_member_api_docs
  String get km {
    return _localizedValues[locale.languageCode]['km'];
  }

  // ignore: public_member_api_docs
  String get sec {
    return _localizedValues[locale.languageCode]['sec'];
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