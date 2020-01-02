import 'package:flutter/foundation.dart';

class Horoscope {
  final String name;
  final String imagePath;
  final String startDate;
  final String endDate;

  const Horoscope({
    @required this.name,
    @required this.imagePath,
    @required this.startDate,
    @required this.endDate,
  });
}
