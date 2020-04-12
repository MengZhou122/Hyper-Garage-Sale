import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String label;
  final bool price;
  final bool numberKeyboard;
  final bool description;
  final Function textIn;

  TextCard({
    @required this.label,
    @required this.textIn,
    this.price,
    this.description = false,
    this.numberKeyboard = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: true,
      autofocus: true,
      keyboardType: numberKeyboard
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      minLines: description ? 1 : 1,
      maxLines: description ? 5 : 1,
      onChanged: textIn,
      decoration: InputDecoration(
        prefixIcon: price == true ? Icon(Icons.attach_money, size: 17.0) : null,
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
