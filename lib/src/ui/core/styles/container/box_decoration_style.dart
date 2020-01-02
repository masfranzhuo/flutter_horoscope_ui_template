import 'package:flutter/material.dart';

import 'elevation_style.dart';

BoxDecoration boxDecorationStyle({
  Color color,
  double borderRadius,
  double elevation = 0,
  Color elevationColor
}) {
  return BoxDecoration(
    color: color ?? Colors.white,
    borderRadius: BorderRadius.circular(borderRadius ?? 0),
    boxShadow: elevation > 0 ? [elevationStyle(elevation: elevation, color: elevationColor)] : null,
  );
}
