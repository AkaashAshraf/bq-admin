import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        // FadeEffect(delay: Duration(milliseconds: 800)),
        // MoveEffect()
        MoveEffect(
            begin: Offset(0, -200),
            curve: Curves.easeInOut,
            delay: Duration(milliseconds: 000),
            duration: Duration(milliseconds: 600)),
      ],
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: ClipOval(
              // height: 100,
              // width: 100,

              child: Image.asset('assets/images/logo.jpeg',
                  height: height * 0.18,
                  scale: 2.5,
                  // color: Color.fromARGB(255, 15, 147, 59),
                  opacity: const AlwaysStoppedAnimation<double>(0.75)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // const Text(
          //   "Beauty Queens",
          //   style: TextStyle(
          //     color: logoTextColor,
          //     fontSize: 30,
          //   ),
          // )
        ],
      ),
    );
  }
}
