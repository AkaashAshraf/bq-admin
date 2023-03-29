import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class BQLoaing extends StatelessWidget {
  const BQLoaing({
    Key? key,
    this.height = 45,
    this.width = 45,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [
          primaryColor,
        ],
        strokeWidth: 2,
      ),
    );
  }
}
