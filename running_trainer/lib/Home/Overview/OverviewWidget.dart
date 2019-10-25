import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/localizations.dart';
import 'Circle/CircleButton.dart';
import 'Stats/StatsWidget.dart';

class OverviewWidget extends StatefulWidget {

  OverviewWidget({Key key}) : super(key: key);

  @override
  OverviewState createState() => OverviewState();
}

class OverviewState extends State<OverviewWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() => null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              StatsWidget(isWeek: true, header: AppLocalizations.of(context).last_week),
              StatsWidget(isWeek: false, header: AppLocalizations.of(context).last_month)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleButton(
              color: _tabController.index == 0 ? Colors.green : Colors.grey,
              size: 10,
              onTap: () => setState(() => _tabController.animateTo(0)),
            ),
            CircleButton(
              color: _tabController.index == 1 ? Colors.green : Colors.grey,
              size: 10,
              onTap: () => setState(() => _tabController.animateTo(1)),
            )
          ],
        )
      ],
    );
  }
}