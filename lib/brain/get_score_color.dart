import 'package:flutter/material.dart';

Color getScoreColor(double rate) {
  if (rate < 0.4) {
    return Colors.red;
  } else {
    if (rate < 0.7) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }
}
