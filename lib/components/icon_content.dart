import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 55.0,
          color: Colors.blueGrey.shade800,
        ),
        SizedBox(height: 20.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
