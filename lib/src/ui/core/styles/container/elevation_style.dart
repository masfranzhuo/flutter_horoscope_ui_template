import 'package:flutter/material.dart';

BoxShadow elevationStyle({double elevation = 1, Color color}) {
  return BoxShadow(
    color: color ?? Colors.black12,
    blurRadius: elevation * 0.75, // has the effect of softening the shadow
    spreadRadius: elevation * 0.75, // has the effect of extending the shadow
    offset: Offset(
      elevation * 0.3, // horizontal, move right 10
      elevation, // vertical, move down 10
    ),
  );
}