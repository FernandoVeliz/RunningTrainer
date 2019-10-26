import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/gps.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'package:running_trainer/Utils/track.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// A map widget with gps handler
class MapWidget extends StatefulWidget {
  // ignore: public_member_api_docs
  MapWidget({@required this.track, Key key, this.height, this.width}) : super(key: key);

  /// The track that should be shown
  final Track track;
  /// The height of the map widget
  final double height;
  /// The width of the map widget
  final double width;

  @override
  MapWidgetState createState() => MapWidgetState();
}

/// State for the map widget
class MapWidgetState extends State<MapWidget> {

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  double _accuracy = double.infinity;

  final Gps _gps = Gps();

  @override
  void initState() {
    _gps.streamLocation((Position pos) {
      print('Accuracy: ${pos.accuracy}m\nSpeed: ${pos.speed}\n');
      setState(() => _accuracy = pos.accuracy);
      if (_controller.isCompleted) {
        _mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(pos.latitude, pos.longitude), 
              zoom: 17
            )
          )
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _gps.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: GoogleMap(
              polylines: Set.from(widget.track.lines.map((Line line) => Polyline(
                  polylineId: PolylineId(line.start.toString()),
                  visible: true,
                  points: [
                    LatLng(line.start.latitude, line.start.longitude), 
                    LatLng(line.end.latitude, line.end.longitude)
                  ],
                  color: Colors.green
                )
              )),
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(40.801498, 11.9691001),
                zoom: 1,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                _controller.complete(controller);
              },
            )
          ),
          if (_accuracy != double.infinity)
            Positioned(
              top: 0,
              left: 5,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '${AppLocalizations.of(context).accuracy}: ${_accuracy.toStringAsFixed(2)}m',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            )
        ],
      )
    );
  }
}
