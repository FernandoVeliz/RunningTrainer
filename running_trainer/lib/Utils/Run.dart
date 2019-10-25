import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';

class Position {
  final double x;
  final double y;
  final DateTime timestamp;

  Position({@required this.x, @required this.y, @required this.timestamp});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      x: json['x'],
      y: json['y'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class Run {
  String id;
  DateTime start;
  DateTime end;
  Duration activeTime;
  double distance;

  Run(this.start, this.end, this.activeTime, this.distance) {
    id = start.toIso8601String();
  }

  List<Position> get positions {
    return json
            .decode(Storage.getString(Keys.positions(id), defaultValue: '[]'))
            .cast<List<Map<String, dynamic>>()
            .map((Map<String, dynamic> json) => Position.fromJson(json));
  }

  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      DateTime.parse(json['start']),
      DateTime.parse(json['end']),
      Duration(seconds: json['activeTime']),
      json['distance'],
    );
  }

  String toJson() {
    return json.encode({
      'start': start.toIso8601String(),
      'end': end.toIso8601String(),
      'activeTime': activeTime.inSeconds,
      'distance': distance,
    });
  }

  void save() {
    Storage.setString(Keys.run(id), toJson());
    Storage.setString(Keys.positions(id), json.encode(positions));
  }
}
