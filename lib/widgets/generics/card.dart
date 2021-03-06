import 'package:flutter/material.dart';

class GenericLoginCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final EdgeInsetsGeometry padding;

  const GenericLoginCard(
      {Key key,
      this.child,
      this.padding = const EdgeInsets.all(16),
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).cardTheme.color,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).cardTheme.shadowColor,
                blurRadius: 16,
                offset: Offset(0.0, 0.0))
          ]),
    );
  }
}
