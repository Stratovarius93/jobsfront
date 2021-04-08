import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GenericMainInputDropdown extends StatefulWidget {
  /// List<String> from items
  final List<String> items;

  /// Default Value
  final String dropdownValue;

  /// Function to onChanged
  final Function(String) onChanged;

  /// Width of DropdownButton
  final double width;

  const GenericMainInputDropdown(
      {Key key,
      @required this.items,
      @required this.dropdownValue,
      this.onChanged,
      this.width = double.infinity})
      : super(key: key);
  @override
  _GenericMainInputDropdownState createState() =>
      _GenericMainInputDropdownState();
}

class _GenericMainInputDropdownState extends State<GenericMainInputDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      width: widget.width,
      decoration: BoxDecoration(
        color: colorFillInput,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorBorderInput, width: 1.5),
      ),
      child: DropdownButton<String>(
        underline: Container(),
        isExpanded: true,
        value: widget.dropdownValue,
        icon: Icon(Ionicons.chevron_down_outline),
        iconSize: 24,
        elevation: 16,
        style: utilsLoginInputTextStyle(screenWidth(context) * 0.05),
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
