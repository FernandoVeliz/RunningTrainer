import 'package:flutter/material.dart';

/// Page to show a value for a track
class ValueWidget extends StatelessWidget {

  // ignore: public_member_api_docs
  ValueWidget({@required this.value, this.info, Key key}) : super(key: key);

  /// The info of this value
  final String info;

  /// The value that should be shown
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                width: 3
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(10)
              )
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green
                ),
              ),
            ),
          ),
        ),
        if (info != null)
          Positioned(
            left: 20,
            top: 3,
            child: Container(
              padding: EdgeInsets.only(left: 3, right: 3),
              color: Colors.white,
              child: Text(
                info, 
                style: TextStyle(
                  color: Colors.black54,
                )
              )
            ),
          )
      ],
    );
  }
}
