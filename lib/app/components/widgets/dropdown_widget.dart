// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hamzah_wallet/app/components/widgets/text_widget.dart';

class DropdownWidget extends StatelessWidget {
  DropdownWidget(
      {super.key,
      required this.listItems,
      required this.value,
      required this.onChanged});
  var listItems;
  var value;
  Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton(
          focusColor: Colors.transparent,
          dropdownColor: Colors.white,
          value: value == null || value == '' ? listItems.first : value,
          isExpanded: true,
          items: listItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextDefault(message: value),
            );
          }).toList(),
          onChanged: onChanged),
    );
  }
}
