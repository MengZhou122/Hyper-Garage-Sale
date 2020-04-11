import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      keyboardType: numberKeyboard ? TextInputType.number : TextInputType.text,
      minLines: description ? 1 : 1,
      maxLines: description ? 10 : 1,
      onChanged: textIn,
      decoration: InputDecoration(
        prefixIcon: price == true
            ? Icon(
                FontAwesomeIcons.dollarSign,
                size: 17.0,
              )
            : null,
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
