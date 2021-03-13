import 'package:flutter/material.dart';

showModalBottom(BuildContext context, Widget child) {
  showModalBottomSheet<void>(
    //enableDrag: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    context: context,
    builder: (_) {
      return child;
    },
  );
}
