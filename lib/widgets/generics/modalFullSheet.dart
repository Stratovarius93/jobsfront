import 'package:flutter/material.dart';

showModalFull(BuildContext context, Widget child) {
  showModalBottomSheet<void>(
      context: context,
      builder: (_) {
        return child;
      });
}
