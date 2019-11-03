import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:running_trainer/Utils/track.dart';
import 'package:running_trainer/Map/MapWidget.dart';
import 'package:running_trainer/Track/Value/ValueWidget.dart';

/// Page to start a track
class TrackPage extends StatefulWidget {
  // ignore: public_member_api_docs
  TrackPage({@required this.track, Key key}) : super(key: key);

  /// The current track
  final Track track;

  @override
  TrackPageState createState() => TrackPageState();
}

/// State for the start track page
class TrackPageState extends State<TrackPage> {
  PanelController _panelController; 
  bool _autoZoom = true;
  
  @override
  void initState() {
    _panelController = PanelController();
    Future.delayed(Duration(seconds: 1), init);
    super.initState();
  }

  void init() {
    print('${widget.track.name}: ${widget.track.activeTime} ${widget.track.distance} ${widget.track.averageSpeed} ${widget.track.onUpdate}');
    setState(() => null);
    widget.track.onUpdate = () {
      if (mounted) {
        setState(() {});
        print('${widget.track.name}: ${widget.track.activeTime} ${widget.track.distance} ${widget.track.averageSpeed}');
      }
    };
  }

  void _togglePanel() {
    if (_panelController.isPanelClosed()) {
      _panelController.open();
    } else {
      _panelController.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 180),
            child: MapWidget(track: widget.track, autoZoom: _autoZoom, trackLocation: true,),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.center_focus_strong, color: _autoZoom ? Colors.green : Colors.black54,),
              onPressed: () => setState(() => _autoZoom = !_autoZoom),
            ),
          ),
          SlidingUpPanel(
            controller: _panelController,
            slideDirection: SlideDirection.DOWN,
            minHeight: 200,
            panel: GestureDetector(
              onTap: _togglePanel,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                      child: GridView.count(
                        reverse: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 4,
                        children: <Widget>[
                          ValueWidget(
                            info: AppLocalizations.of(context).kmh,
                            value: widget.track.positions.isNotEmpty ? (widget.track.positions.last.speed * 3.6).toStringAsFixed(2) : '0',
                          ),
                          ValueWidget(
                            info: AppLocalizations.of(context).km,
                            value: widget.track.distance.toStringAsFixed(2),
                          ),
                          ValueWidget(
                            info: AppLocalizations.of(context).min,
                            value: widget.track.activeTime.inMinutes.toString(),
                          ),
                          ValueWidget(
                            info: AppLocalizations.of(context).sec,
                            value: (widget.track.activeTime.inSeconds % 60).toString(),
                          ),
                          ValueWidget(
                            info: '~${AppLocalizations.of(context).kmh}',
                            value: widget.track.averageSpeed.toStringAsFixed(2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 50,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: 100,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        )
                      ),
                    )
                  ]
                )
              )
            )
          ),
        ],
      )
    );
  }
}
