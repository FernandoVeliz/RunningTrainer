import 'package:flutter/material.dart';
import 'package:running_trainer/Run/StartRunPage.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/user.dart';
import 'package:running_trainer/Home/Topic/TopicWidget.dart';
import 'package:running_trainer/Home/Overview/OverviewWidget.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/localizations.dart';

/// The home page view with the list of options
class HomePage extends StatefulWidget {
  // ignore: public_member_api_docs
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

/// State for the home page
class HomePageState extends State<HomePage> {
  bool _loaded = false;

  @override
  void initState() {
    // Init all needed features
    () async {
      await Storage.init();
      await User.init();
      await History.init();
      setState(() => _loaded = true);
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
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
            id: 'overview',
            child: OverviewWidget(),
          ),
          TopicWidget(
            id: 'start_run',
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Scaffold(
                body: StartRunPage()
              ))
            ),
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
                      AppLocalizations.of(context).newRun, 
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
            id: 'start_training',
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
                      AppLocalizations.of(context).newTraining,
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
            id: 'history',
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
                              AppLocalizations.of(context).lastRuns, 
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
