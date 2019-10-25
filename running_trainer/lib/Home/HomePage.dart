import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/user.dart';
import 'Topic/TopicWidget.dart';
import 'Overview/OverviewWidget.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/run.dart';
import 'package:running_trainer/Utils/localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool loaded = false;

  @override
  void initState() {
    // Init all needed features
    () async {
      await Storage.init();
      await User.init();
      await History.init();
      setState(() => loaded = true);
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return Scaffold(
        body: Center(
          child: Image.asset('assets/running.gif', width: 40, height: 40),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TopicWidget(
            child: OverviewWidget(),
          ),
          TopicWidget(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: Icon(Icons.directions_run, color: Colors.green),
                ),
                Expanded(
                  flex: 79,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).new_run, 
                      style: TextStyle(color: Colors.black54),
                    )
                  )
                ),
                Expanded(
                  flex: 10,
                  child: Icon(Icons.add, color: Colors.green),
                )          
              ]
            )
          ),
          TopicWidget(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: Icon(Icons.timer, color: Colors.green),
                ),
                Expanded(
                  flex: 79,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).new_training, 
                      style: TextStyle(color: Colors.black54),
                    )
                  )
                ),
                Expanded(
                  flex: 10,
                  child: Icon(Icons.add, color: Colors.green),
                )          
              ]
            )
          ),

          TopicWidget(
            child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 13,
                          child: Icon(Icons.format_list_numbered, color: Colors.green),
                        ),
                        Expanded(
                          flex: 80,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context).last_runs, 
                              style: TextStyle(color: Colors.black54)
                            )
                          )
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(History.getAllRuns().length.toString(), style: TextStyle(
                            color: Colors.green,
                            fontSize: 20
                          ),),
                        )  
                      ],
                    )
                  ]..addAll(
                    History.getAllRuns().map((run) {
                      return Container();
                    }).toList()
                  ),
                )
          )
        ],
      )
    );
  }
}
