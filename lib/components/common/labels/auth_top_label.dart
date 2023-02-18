import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class AuthTopText extends StatelessWidget {
  AuthTopText({
    Key? key,
    required this.width,
    required this.title,
  }) : super(key: key);

  final double width;
  String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 0,
        right: 0,
        child: Animate(
          effects: const [
            // FadeEffect(delay: Duration(milliseconds: 800)),
            // MoveEffect()
            MoveEffect(
                begin: Offset(0, -200),
                curve: Curves.easeInOut,
                delay: Duration(milliseconds: 000),
                duration: Duration(milliseconds: 600)),
          ],
          child: SizedBox(
              // height: 100,
              width: width,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: secandaryColor,
                    fontFamily: "primary",
                    fontSize: getTextSize(context).authTitleText,
                    fontWeight: FontWeight.w500),
              )),
        ));
  }
}
