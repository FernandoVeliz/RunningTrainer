import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/storage.dart';
import 'package:running_trainer/Utils/user.dart';
import 'package:running_trainer/Utils/history.dart';
import 'package:running_trainer/Utils/run.dart';
import 'package:running_trainer/Utils/localizations.dart';

class RunPage extends StatefulWidget {
  RunPage({Key key}) : super(key: key);

  @override
  RunPageState createState() => RunPageState();
}

class RunPageState extends State<RunPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Test'),
    );
  }
}
