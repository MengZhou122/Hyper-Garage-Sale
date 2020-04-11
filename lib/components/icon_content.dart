import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5.0),
        Icon(icon, size: 55.0, color: Colors.blueGrey.shade800),
        SizedBox(height: 10.0),
        Text(label, style: TextStyle(fontSize: 20.0)),
      ],
    );
  }
}
