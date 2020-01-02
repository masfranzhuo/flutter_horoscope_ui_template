import 'package:flutter/material.dart';

const double DefaultSpacing = 8;
const double TightSpacing = 4;
const double WideSpacing = 16;

class VerticalSpacing extends StatelessWidget {
  final double spacing;

  VerticalSpacing({this.spacing = DefaultSpacing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacing);
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double spacing;

  HorizontalSpacing({this.spacing = DefaultSpacing});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spacing);
  }
}