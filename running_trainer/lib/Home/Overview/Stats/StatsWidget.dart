import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'package:running_trainer/Utils/user.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/keys.dart';

class StatsWidget extends StatefulWidget {

  final String header;
  final bool isWeek;

  StatsWidget({Key key, @required this.header, @required this.isWeek}) : super(key: key);

  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<StatsWidget> {
  double widthTime = 0;
  double widthDistance = 0;
  int aimTime;
  int aimDistance;
  int currentTime;
  int currentDistance;

  bool timeAimIsSet = false;
  bool distanceAimIsSet = false;

  static const defaultWeekTime = 500;
  static const defaultMonthTime = 2000;
  static const defaultWeekDistance = 50;
  static const defaultMonthDistance = 200;

  @override
  void initState() {
    timeAimIsSet = Storage.getInt(widget.isWeek ? Keys.weekAimTime : Keys.monthAimTime) != null;
    distanceAimIsSet = Storage.getInt(widget.isWeek ? Keys.weekAimDistance : Keys.monthAimDistance) != null;
    aimTime = widget.isWeek ? User.getWeekTimeAim() : User.getMonthTimeAim();
    aimDistance = widget.isWeek ? User.getWeekDistanceAim() : User.getMonthDistanceAim();
    DateTime current = DateTime.now();
    currentTime = History.getMinutesSince(current..subtract(Duration(days: current.weekday)));
    currentDistance = History.getDistanceSince(current..subtract(Duration(days: current.weekday)));
    super.initState();
  }

  void setAim(bool isTime) async {
    int result = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.integer(
          minValue: 1,
          maxValue: (isTime ? 3000 : 500) * (widget.isWeek ? 1 : 4),
          title: new Text(AppLocalizations.of(context).distance),
          initialIntegerValue: widget.isWeek ? 
            (isTime ? defaultWeekTime : defaultWeekDistance) : 
            (isTime ? defaultMonthTime : defaultMonthDistance),
          infiniteLoop: true,
        );
      }
    );

    if (result != null) {
      if (widget.isWeek) {
        if (isTime) User.setWeekTimeAim(result);
        else User.setWeekDistanceAim(result);
      }
      else {
        if (isTime) User.setMonthTimeAim(result);
        else User.setMonthDistanceAim(result);
      }
      setState(() {
        aimTime = widget.isWeek ? User.getWeekTimeAim() : User.getMonthTimeAim();
        aimDistance = widget.isWeek ? User.getWeekDistanceAim() : User.getMonthDistanceAim();
        if (isTime) timeAimIsSet = true;
        else distanceAimIsSet = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Future.delayed(Duration(milliseconds: 10)).then((_) {
          if (mounted) {
            setState(()  {
              widthTime = min(constraints.maxWidth * (currentTime / aimTime), constraints.maxWidth);
              widthDistance = min(constraints.maxWidth * (currentDistance / aimDistance), constraints.maxWidth);
            });
          }
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  widget.header,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black54
                  ),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => setAim(true),
                  child: Stack(
                    children: <Widget>[
                      AnimatedContainer(
                        color: Colors.green,
                        height: 20,
                        width: widthTime,
                        duration: Duration(seconds: 2),
                        curve: Curves.bounceOut,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, top: 2),
                        child: Text(
                          timeAimIsSet ?
                            '$currentTime/$aimTime min' :
                            '$currentTime  -  ${AppLocalizations.of(context).set_time_aim}', 
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => setAim(false),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Stack(
                      children: <Widget>[
                        AnimatedContainer(
                          color: Colors.green,
                          height: 20,
                          width: widthDistance,
                          duration: Duration(seconds: 2),
                          curve: Curves.bounceOut,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2, top: 2),
                          child: Text(
                            distanceAimIsSet ?
                              '$currentDistance/$aimDistance km' :
                              '$currentDistance  -  ${AppLocalizations.of(context).set_distance_aim}',  
                            style: TextStyle(
                              color: Colors.black54
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}