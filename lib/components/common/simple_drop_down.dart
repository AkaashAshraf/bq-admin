import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';

class SimpleDropDown extends StatefulWidget {
  const SimpleDropDown({
    Key? key,
    required this.onTap,
    this.title = "",
    this.validator = "",
    this.hint = "",
  }) : super(key: key);
  final String validator;

  final String title;
  final String hint;
  final dynamic onTap;

  @override
  State<SimpleDropDown> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  bool isObscure_ = true;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.validator == "" ? primaryColor : Colors.red,
                    width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          style: const TextStyle(
                              color: inputTexrColor,
                              fontFamily: "primary",
                              fontSize: 15),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: inputTexrColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width,
                      height: height * 0.06,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.hint,
                            maxLines: 1,
                            style: const TextStyle(
                                color: inputTexrColor,
                                fontFamily: "primary",
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: Text(
                widget.validator,
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.red, fontFamily: "primary", fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
