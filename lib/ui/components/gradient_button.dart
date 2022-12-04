import 'package:flutter/material.dart';

Widget gradientButton(Widget child, Function onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
    onPressed: () => onPressed(),
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.pink[300]!],
        ),
      ),
      child: child,
    ),
  );
}
