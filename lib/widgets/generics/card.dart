import 'package:AppWork/constants/colors.dart';
import 'package:flutter/material.dart';

class GenericLoginCard extends StatelessWidget {
  final Widget child;

  const GenericLoginCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: colorTextSubTitle.withOpacity(0.2),
                blurRadius: 16,
                offset: Offset(0.0, 0.0))
          ]),
    );
  }
}
