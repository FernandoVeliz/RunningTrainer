import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/localizations.dart';

/// Button to start a run
class StartButton extends StatelessWidget {

  /// Pressed callback
  final Function() onPressed;

  // ignore: public_member_api_docs
  StartButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      color: Colors.green,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Text(
        AppLocalizations.of(context).startRun, 
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}