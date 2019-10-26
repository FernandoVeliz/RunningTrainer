import 'package:flutter/material.dart';
import 'package:running_trainer/Home/Topic/TopicWidget.dart';
import 'package:running_trainer/Map/MapWidget.dart';
import 'package:running_trainer/Start/StartButton.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'package:running_trainer/Utils/track.dart';

/// Page to start a track
class StartTrackPage extends StatefulWidget {
  // ignore: public_member_api_docs
  StartTrackPage({Key key}) : super(key: key);

  @override
  StartTrackPageState createState() => StartTrackPageState();
}

/// State for the start track page
class StartTrackPageState extends State<StartTrackPage> {
  Track _track = Track();
  TextEditingController _routeController;
  String _currentRoute;
  //FocusNode _input; 
  
  @override
  void initState() {
    _routeController = TextEditingController();
    super.initState();
  }

  bool get _readyToStart {
    return _currentName != null;
  }

  String get _currentName {
    return _routeController.text.isNotEmpty ? _routeController.text : _currentRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: TopicWidget(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              id: 'start_track',
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 11,
                            child: Icon(Icons.directions_run, color: Colors.green),
                          ),
                          Expanded(
                            flex: 79,
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context).newTrack, 
                                style: TextStyle(color: Colors.black54),
                              )
                            )
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(),
                          )          
                        ]
                      ),
                      MapWidget(track: _track, height: constraints.maxHeight - 200),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 40,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: TextField(
                                maxLines: 1,
                                controller: _routeController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: AppLocalizations.of(context).newRoute,
                                ),
                                onChanged: (_) => setState(() => null),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20, 
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context).or,
                                style: TextStyle(
                                  color: Colors.green
                                ),
                              ),
                            )
                          ),
                          Expanded(
                            flex: 40,
                            child: DropdownButton<String>(
                              hint: Text(AppLocalizations.of(context).lastRoutes),
                              value: _currentRoute,
                              onChanged: (String value) {
                                final Track track = History.getAllTracks().where((Track track) => track.name == value).last;
                                setState(() {
                                  _currentRoute = value;
                                  _track = track;
                                });
                              },
                              items: History.getAllTracks().map((track) => track.name).toSet().map((String name) =>
                                DropdownMenuItem<String>(
                                  value: name,
                                  child: Text(name),
                                )
                              ).toList(),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: StartButton(
                          enabled: _readyToStart,
                          onPressed: () => print('pressed'),
                        ),
                      )
                    ]
                  );
                },
              )
            )
          ),
        ),
      ),
    );
  }
}
