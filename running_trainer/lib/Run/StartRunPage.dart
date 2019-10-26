import 'package:flutter/material.dart';
import 'package:running_trainer/Home/Topic/TopicWidget.dart';
import 'package:running_trainer/Map/MapWidget.dart';
import 'package:running_trainer/Start/StartButton.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'package:running_trainer/Utils/run.dart';

/// Page to start a run
class StartRunPage extends StatefulWidget {
  // ignore: public_member_api_docs
  StartRunPage({Key key}) : super(key: key);

  @override
  StartRunPageState createState() => StartRunPageState();
}

/// State for the start run page
class StartRunPageState extends State<StartRunPage> {
  final Run _run = Run();
  TextEditingController _routeController;
  String _currentRoute;
  //FocusNode _input; 
  
  @override
  void initState() {
    _routeController = TextEditingController();
    super.initState();
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
              id: 'start_run',
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
                                AppLocalizations.of(context).newRun, 
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
                      MapWidget(run: _run, height: constraints.maxHeight - 200),
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
                                onSubmitted: (String text) => null,
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
                              onChanged: (String value) => setState(() => _currentRoute = value),
                              items: History.getAllRuns().map((run) => run.name).toSet().map((String name) =>
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
                          onPressed: () => null,
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
