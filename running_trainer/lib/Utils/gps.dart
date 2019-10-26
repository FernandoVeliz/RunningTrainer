import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';



class Gps {
  Geolocator _geolocator;
  StreamSubscription<Position> _locationStream;

  Gps() {
    _geolocator = Geolocator();
  }
  
  /// Streams the current location with a callback
  void streamLocation(Function(Position position) onPos) {
    cancel();
    _locationStream = _geolocator.getPositionStream(LocationOptions(
      accuracy: LocationAccuracy.best,
      timeInterval: 1000,
    )).listen(onPos);
  }

  /// Closes the location stream
  @required
  void cancel() {
    _locationStream?.cancel();
    _locationStream = null;
  }
}