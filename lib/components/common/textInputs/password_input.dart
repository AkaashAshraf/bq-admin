import 'package:bq_admin/components/common/textInputs/text_input.dart';
import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  PasswordInput({
    Key? key,
    required this.onTextChange,
    required this.lable,
  }) : super(key: key);
  dynamic onTextChange;
  String lable;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return textInputCustom(
        label: widget.lable,
        initialValue: "",
        obscureText: _isObscure,
        preIcon: const Icon(
          Icons.lock,
          size: 20,
          color: primaryColor,
        ),
        postIcon: GestureDetector(
          onTap: () => {
            setState(() {
              _isObscure = !_isObscure;
            })
          },
          child: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            size: 20,
            color: Colors.black38,
          ),
        ),
        onTextChange: (val) {
          widget.onTextChange(val);
        });
  }
}
