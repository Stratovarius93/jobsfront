import 'package:AppWork/constants/colors.dart';
import 'package:flutter/material.dart';

class GenericLoginCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const GenericLoginCard(
      {Key key, this.child, this.padding = const EdgeInsets.all(16)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: colorBackgroundCard,
          boxShadow: [
            BoxShadow(
                color: colorShadowCard,
                blurRadius: 16,
                offset: Offset(0.0, 0.0))
          ]),
    );
  }
}
