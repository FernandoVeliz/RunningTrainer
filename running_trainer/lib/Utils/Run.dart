import 'dart:convert';

import 'package:geolocator/geolocator.dart' show Position;
import 'package:latlong/latlong.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';

export 'package:geolocator/geolocator.dart' show Position;

/// Describes a line
class Line {
  final LatLng start;
  final LatLng end;

  /// Creates a new line
  Line(this.start, this.end);

  /// The distance in km
  double get distance {
    final Distance _distance = Distance(roundResult: false);
    return _distance.as(LengthUnit.Kilometer, start, end);
  }
}

/// Describes a run
class Run {
  String _id;

  /// Name of this run
  String name;

  /// The start time of this run
  DateTime start;

  /// The end time of this run
  DateTime end;

  /// The active running time 
  Duration activeTime;

  /// The distance in km
  double distance;

  /// the average Speed in km/h
  double averageSpeed;

  /// All tracked positions
  List<Position> _positions;

  /// Creates a new run
  Run({this.name, this.start, this.end, this.activeTime, this.distance, this.averageSpeed}) {
    if (start == null) {
      start = DateTime.now();
      activeTime = Duration(seconds: 0);
      distance = 0;
    }
    _id = start.toIso8601String();
    if (!isFinished) {
      _positions = [];
    }
  }

  /// Returns if the run is still active or already finished
  bool get isFinished => end != null;

  /// Returns all positions of this run
  List<Position> get positions {
    return _positions ??= positionsFromJson();
  }

  /// Returns all lines of this run
  List<Line> get lines {
    if (positions.length <= 1) {
      return [];
    }
    final List<Line> lines = [];
    for (int i = 0; i < positions.length - 1; i++) {
      final LatLng pos1 = LatLng(positions[i].latitude, positions[i].longitude);
      final LatLng pos2 = LatLng(positions[i+1].latitude, positions[i+1].longitude);
      lines.add(Line(pos1, pos2));
    }
    return lines;
  }

  /// Add a new position to this run
  /// 
  /// This automatically recalculates all values
  void addPosition(Position pos) {
    _positions.add(pos);
    if (_positions.length > 1) {
      addDistance(_positions[_positions.length - 2], pos);
      activeTime = calculateActiveTime();
      averageSpeed = calculateAverageSpeed();
    }
    else {
      start = pos.timestamp;
    }
  }

  /// Calculates the average speed in km/h
  double calculateAverageSpeed() {
    // km / h
    return distance / (activeTime.inSeconds / 3600); 
  }

  /// Calculates the active running time
  Duration calculateActiveTime() {
    return start.difference(_positions[_positions.length - 1].timestamp);
  }

  /// Adds a new distance to the current distance
  void addDistance(Position p1, Position p2, {LengthUnit lengthUnit = LengthUnit.Kilometer}) {
    distance += Line(
        LatLng(p1.latitude, p1.longitude),
        LatLng(p2.latitude, p2.longitude),
    ).distance;
  }

  /// Calculates the distance of the whole run
  double calculateDistance({LengthUnit lengthUnit = LengthUnit.Kilometer}) {
    return lines.map((Line line) => line.distance).reduce((double d1, double d2) => d1 + d2);
  }

  /// Finishes ans saves a run
  void finish() {
    if (!isFinished) {
      end = _positions[_positions.length].timestamp;
      save();
    }
  }

  /// Loads all positions from json
  List<Position> positionsFromJson() {
    return json
            .decode(Storage.getString(Keys.positions(_id), defaultValue: '[]'))
            .cast<List<Map<String, dynamic>>()
            .map((Map<String, dynamic> json) => Position.fromMap);
  }

  /// Loads a run from json
  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      name: json['name'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      activeTime: Duration(seconds: json['activeTime']),
      distance: json['distance'],
      averageSpeed: json['averageSpeed']
    );
  }

  /// Converts this run to a json
  /// 
  /// The [distance] must be saved separately, 
  /// because this can be a lot of data and should not be loaded a once
  String toJson() {
    return json.encode({
      'name': name,
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'activeTime': activeTime.inSeconds,
      'distance': distance,
      'averageSpeed': averageSpeed
    });
  }

  /// Saves this run in the storage
  void save() {
    Storage.setString(Keys.run(_id), toJson());
    Storage.setString(Keys.positions(_id), json.encode(positions));
  }
}
