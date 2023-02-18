import 'package:bq_admin/config/colors.dart';
import 'package:flutter/material.dart';

// TextFormField _customTextInput(
//     {required String label,
//     required String initialValue,
//     int maxLines = 1,
//     dynamic validator,
//     TextInputType keyboardType: TextInputType.text,
//     AutovalidateMode autovalidateMode: AutovalidateMode.disabled,
//     required dynamic onTextChange}) {
//   return TextFormField(
//     onChanged: (val) {
//       onTextChange(val);
//     },
//     autocorrect: false,
//     initialValue: initialValue,
//     autovalidateMode: autovalidateMode,
//     validator: validator,
//     keyboardType: keyboardType,
//     maxLines: maxLines,
//     decoration: InputDecoration(
//       labelText: label,
//       isDense: true,
//       contentPadding: const EdgeInsets.all(15),
//       labelStyle: const TextStyle(color: text1Color, fontSize: 12),
//       hintStyle: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3)),
//       focusedBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.blue, width: 1),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.red),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: Colors.red),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//     ),
//   );
// }

class textInputCustom extends StatelessWidget {
  const textInputCustom(
      {Key? key,
      this.maxLength,
      required this.label,
      required this.initialValue,
      this.maxLines: 1,
      this.validator,
      this.postIcon,
      this.preIcon,
      this.keyboardType: TextInputType.text,
      this.isElevation: false,
      this.autovalidateMode: AutovalidateMode.disabled,
      required this.onTextChange,
      this.obscureText = false})
      : super(key: key);
  final String label;
  final String initialValue;
  final int maxLines;
  final dynamic validator;
  final TextInputType keyboardType;
  final AutovalidateMode autovalidateMode;
  final dynamic onTextChange;
  final dynamic maxLength;
  final dynamic postIcon;
  final dynamic preIcon;
  final bool obscureText;

  final isElevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isElevation ? 2 : 0,
      child: TextFormField(
        style: const TextStyle(fontFamily: "primary"),
        onChanged: (val) {
          onTextChange(val);
        },
        obscureText: obscureText,
        autocorrect: false,
        initialValue: initialValue,
        autovalidateMode: autovalidateMode,
        validator: validator,
        maxLength: maxLength,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon: postIcon,
          prefixIcon: preIcon,
          labelText: label,
          isDense: true,
          contentPadding: const EdgeInsets.all(15),
          labelStyle: const TextStyle(
            color: inputTexrColor,
            fontSize: 15,
            fontFamily: "primary",
          ),
          hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: "primary",
              color: Colors.black.withOpacity(0.3)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
