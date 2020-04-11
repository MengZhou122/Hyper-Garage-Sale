import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextCard extends StatelessWidget {
  final String label;
  final bool price;
  final bool description;
  final Function textIn;
  TextCard({
    @required this.label,
    @required this.textIn,
    this.price,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: true,
      autofocus: true,
      minLines: description == true ? 1 : 1,
      maxLines: description == true ? 10 : 1,
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
