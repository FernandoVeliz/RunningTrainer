import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, dynamic>> _localizedValues = {
    // List of all Strings...
    'de': {
      'title': 'Running Trainer',
      'new_run': 'Neuer Lauf',
      'new_training': 'Neues Training',
      'last_runs': 'Letzten Läufe',
      'last_week': 'Letzte Woche',
      'last_month': 'Letzter Monat',
      'minutes': 'Minuten (min)',
      'distance': 'Distanz (km)',
      'set_time_aim': 'Klicke zum setzen deines Zeitziels',
      'set_distance_aim': 'Klicke zum setze deines Distanzziels',
      'distance_per_month': 'Distanz (km) pro Monat',
      'distance_per_week': 'Distanz (km) pro Woche',
      'time_per_month': 'Zeit (min) pro Monat',
      'time_per_week': 'Zeit (min) pro Woche',
    },
    'en': {
      'title': 'Running Trainer',
      'new_run': 'New run',
      'new_training': 'New training',
      'last_runs': 'Last runs',
      'last_week': 'Last week',
      'last_month': 'Last month',
      'minutes': 'Minutes (min)',
      'distance': 'Distance (km)',
      'set_time_aim': 'Click to setup your time aim',
      'set_distance_aim': 'Click to setup your distance aim',
      'distance_per_month': 'Distance (km) per month',
      'distance_per_week': 'Distance (km) per week',
      'time_per_month': 'Time (min) per month',
      'time_per_week': 'Time (min) per week',
    }
  };
  // All getters
  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get new_run {
    return _localizedValues[locale.languageCode]['new_run'];
  }

  String get new_training {
    return _localizedValues[locale.languageCode]['new_training'];
  }

  String get last_runs {
    return _localizedValues[locale.languageCode]['last_runs'];
  }

  String get last_week {
    return _localizedValues[locale.languageCode]['last_week'];
  }

  String get last_month {
    return _localizedValues[locale.languageCode]['last_month'];
  }

  String get minutes {
    return _localizedValues[locale.languageCode]['minutes'];
  }

  String get distance {
    return _localizedValues[locale.languageCode]['distance'];
  }

  String get set_time_aim {
    return _localizedValues[locale.languageCode]['set_time_aim'];
  }

  String get set_distance_aim {
    return _localizedValues[locale.languageCode]['set_distance_aim'];
  }

  String get distance_per_month {
    return _localizedValues[locale.languageCode]['distance_per_month'];
  }

  String get distance_per_week {
    return _localizedValues[locale.languageCode]['distance_per_week'];
  }

  String get time_per_month {
    return _localizedValues[locale.languageCode]['time_per_month'];
  }

  String get time_per_week {
    return _localizedValues[locale.languageCode]['time_per_week'];
  }
  // end all getters
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
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