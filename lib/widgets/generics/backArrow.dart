import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback onPressed;

  const BackArrow({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: new IconButton(
        icon: new Icon(
          Icons.arrow_back,
          color: Theme.of(context).appBarTheme.actionsIconTheme.color,
        ),
        iconSize: 30.0,
        onPressed: onPressed,
      ),
    );
  }
}
