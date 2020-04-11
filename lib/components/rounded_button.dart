import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  RoundedButton({this.color, this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      elevation: 5.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        width: 230.0,
        height: 42.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
