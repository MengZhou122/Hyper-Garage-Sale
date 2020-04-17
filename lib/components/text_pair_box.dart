import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPairBox extends StatelessWidget {
  final String title;
  final String content;

  TextPairBox({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 12.0, color: Colors.black87)),
        SizedBox(height: 2.0),
        Material(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(content,
                style: TextStyle(fontSize: 18.0, color: Colors.white)),
          ),
          color: Colors.lightBlueAccent,
        ),
        SizedBox(height: 2.0),
      ],
    );
  }
}
