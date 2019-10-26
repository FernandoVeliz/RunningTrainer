import 'dart:convert';

import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';
import 'package:running_trainer/Utils/track.dart';

class History {
  static List<Track> _tracks;

  static init() {
    _tracks = [];
    List<String> keys = Storage.getKeys().toList();
    keys.forEach((key) {
      if (key.startsWith(Keys.track(''))) {
        Map<String, dynamic> rawTrack = json.decode(Storage.getString(key));
        Track track = Track.fromJson(rawTrack);
        _tracks.add(track);
      }
    });
  }

  static int getMinutesSince(DateTime since) {
    since.subtract(Duration(minutes: 1));
    final Iterable<Duration> times = _tracks
        .where((Track track) => track.start.isAfter(since))
        .map((Track track) => track.activeTime);
    if (times.isNotEmpty) {
      return times.reduce((Duration time1, Duration time2) => time1 + time2).inMinutes;
    }
    return 0;
  }

  static int getDistanceSince(DateTime since) {
    since.subtract(Duration(minutes: 1));
    final Iterable<double> distances = _tracks
        .where((Track track) => track.start.isAfter(since))
        .map((Track track) => track.distance);
    if (distances.isNotEmpty) {
      return distances.reduce((double distance1, double distance2) => distance1 + distance2).round();
    }
    return 0;
  }

  /// Returns all tracked tracks
  static List<Track> getAllTracks() {
    return _tracks;
  }
}
