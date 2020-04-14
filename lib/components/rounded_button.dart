import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;
  final double width;

  RoundedButton({this.color, @required this.title, this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      elevation: 5.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        width: width == null ? 230.0 : width,
        height: 45.0,
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
