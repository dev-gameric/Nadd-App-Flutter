import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List<String> items;
  final Function(String?) onChanged;
  final String? value;

  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
