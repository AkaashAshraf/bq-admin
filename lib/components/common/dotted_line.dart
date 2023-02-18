import 'package:bq_admin/config/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

DottedLine dottedLine({double thicknes = 1.0}) {
  return DottedLine(
    direction: Axis.horizontal,
    // lineLength: double.infinity,
    lineThickness: thicknes,
    dashLength: 4.0,
    dashColor: Colors.black,
    dashGradient: const [primaryColor, secandaryColor],
    dashRadius: 0.0,
    dashGapLength: 4.0,
    dashGapColor: Colors.transparent,
    dashGapGradient: const [primaryColor, secandaryColor],
    dashGapRadius: 0.0,
  );
}
