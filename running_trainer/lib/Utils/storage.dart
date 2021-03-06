import 'dart:convert';
import 'dart:io' show File, Platform;

import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class Storage {
  static SharedPreferences _sharedPreferences;
  static File _file;
  static Map<String, dynamic> data;

  static Future init() async {
    if (_isDesktop) {
      _file = File('.data.json');
      if (!_file.existsSync()) {
        _file.writeAsStringSync('{}');
      }
      data = json.decode(_file.readAsStringSync());
    } else {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  static void setString(String key, String value) {
    if (_isDesktop) {
      data[key] = value;
    } else {
      _sharedPreferences.setString(key, value);
    }
    _save();
  }

  static void setStringList(String key, List<String> value) {
    if (_isDesktop) {
      data[key] = value;
    } else {
      _sharedPreferences.setStringList(key, value);
    }
    _save();
  }

  // ignore: avoid_positional_boolean_parameters
  static void setBool(String key, bool value) {
    if (_isDesktop) {
      data[key] = value;
    } else {
      _sharedPreferences.setBool(key, value);
    }
    _save();
  }

  static void setInt(String key, int value) {
    if (_isDesktop) {
      data[key] = value;
    } else {
      _sharedPreferences.setInt(key, value);
    }
    _save();
  }

  /// Returns the saved string for the given key
  static String getString(String key, {String defaultValue}) {
    if (_isDesktop) {
      return data[key] ?? defaultValue;
    } else {
      return _sharedPreferences.getString(key) ?? defaultValue;
    }
  }

  static List<dynamic> getStringList(String key, {List<dynamic> defaultValue}) {
    if (_isDesktop) {
      return data[key] ?? defaultValue;
    } else {
      return _sharedPreferences.getStringList(key) ?? defaultValue;
    }
  }

  static bool getBool(String key, {bool defaultValue}) {
    if (_isDesktop) {
      return data[key] ?? defaultValue;
    } else {
      return _sharedPreferences.getBool(key) ?? defaultValue;
    }
  }

  static int getInt(String key, {int defaultValue}) {
    if (_isDesktop) {
      return data[key] ?? defaultValue;
    } else {
      return _sharedPreferences.getInt(key) ?? defaultValue;
    }
  }

  static dynamic get(String key, {dynamic defaultValue}) {
    if (_isDesktop) {
      return data[key] ?? defaultValue;
    } else {
      return _sharedPreferences.get(key) ?? defaultValue;
    }
  }

  static void remove(String key) {
    if (_isDesktop) {
      data.remove(key);
    } else {
      _sharedPreferences.remove(key);
    }
    _save();
  }

  static Set<String> getKeys() {
    if (_isDesktop) {
      return data.keys.toSet();
    } else {
      return _sharedPreferences.getKeys();
    }
  }

  static void _save() {
    if (_isDesktop) {
      _file.writeAsStringSync(json.encode(data));
    }
  }

  static bool get _isDesktop {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}
