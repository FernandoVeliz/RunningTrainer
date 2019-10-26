import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final String id;
  final EdgeInsets padding;

  TopicWidget({Key key, @required this.child, this.onTap, @required this.id, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: id,
        child: Padding(
          padding: padding ?? EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: padding ?? EdgeInsets.all(10),
              child: Padding(
                padding: padding ?? EdgeInsets.all(10),
                child: child,
              ),
            ),
          ),
        ),
      )
    );
  }
}