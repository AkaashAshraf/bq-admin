import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingIndicatore extends StatelessWidget {
  const LoadingIndicatore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 45,
      width: 45,
      child: LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [
          primaryColor,
        ],
        strokeWidth: 2,
      ),
    );
  }
}
