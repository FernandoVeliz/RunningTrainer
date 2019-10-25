import 'dart:convert';

import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';

import 'Run.dart';

class History {
  static List<Run> _runs;

  static init() {
    _runs = [];
    List<String> keys = Storage.getKeys().toList();
    keys.forEach((key) {
      if (key.startsWith(Keys.run(''))) {
        Map<String, dynamic> rawRun = json.decode(Storage.getString(key));
        Run run = Run.fromJson(rawRun);
        _runs.add(run);
      }
    });
  }

  static int getMinutesSince(DateTime since) {
    since.subtract(Duration(minutes: 1));
    final Iterable<Duration> times = _runs
        .where((Run run) => run.start.isAfter(since))
        .map((Run run) => run.activeTime);
    if (times.isNotEmpty) {
      return times.reduce((Duration time1, Duration time2) => time1 + time2).inMinutes;
    }
    return 0;
  }

  static int getDistanceSince(DateTime since) {
    since.subtract(Duration(minutes: 1));
    final Iterable<double> distances = _runs
        .where((Run run) => run.start.isAfter(since))
        .map((Run run) => run.distance);
    if (distances.isNotEmpty) {
      return distances.reduce((double distance1, double distance2) => distance1 + distance2).round();
    }
    return 0;
  }

  static List<Run> getAllRuns() {
    return _runs;
  }
}
