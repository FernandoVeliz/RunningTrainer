import 'package:flutter/material.dart';
import 'package:running_trainer/Utils/localizations.dart';

/// Button to start a track
class StartButton extends StatelessWidget {

  /// Pressed callback
  final Function() onPressed;

  /// If the button is enabled
  final bool enabled;

  // ignore: public_member_api_docs
  StartButton({@required this.onPressed, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      color: Colors.green,
      onPressed: enabled ? onPressed : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Text(
        AppLocalizations.of(context).startTrack, 
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}