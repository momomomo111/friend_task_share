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
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0.0, 1.0),
          ),
        ],
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.pink[300]!],
        ),
      ),
      child: child,
    ),
  );
}
