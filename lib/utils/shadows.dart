import 'package:flutter/material.dart';

BoxShadow shadowPrimaryButton(Color color) => BoxShadow(
    color: color.withOpacity(0.5), blurRadius: 18, offset: Offset(0.0, 0.0));

BoxShadow shadowCircleButtonNavBar(Color color) => BoxShadow(
    color: color.withOpacity(0.8), blurRadius: 12, offset: Offset(0.0, 0.0));
