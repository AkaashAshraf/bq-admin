// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// DropdownButtonHideUnderline searchDropDown(BuildContext context,
//     {required String value, dynamic onChange, required List<dynamic> list}) {
//   final TextEditingController textEditingController = TextEditingController();

//   return DropdownButtonHideUnderline(
//     child: DropdownButton2(
//       // isExpanded: true,
//       // hint: Text(
//       //   'Select Item',
//       //   style: TextStyle(
//       //     fontSize: 14,
//       //     color: Theme.of(context).hintColor,
//       //   ),
//       // ),
//       // items: list
//       //     .map((item) => DropdownMenuItem<String>(
//       //           value: item,
//       //           child: Text(
//       //             item,
//       //             style: const TextStyle(
//       //               fontSize: 14,
//       //             ),
//       //           ),
//       //         ))
//       //     .toList(),
//       // value: value,
//       // onChanged: (value) {
//       //   onChange(value);
//       // },
//       // buttonHeight: 40,
//       // buttonWidth: 200,
//       // itemHeight: 40,
//       // dropdownMaxHeight: 200,
//       // searchController: textEditingController,
//       // searchInnerWidget: Padding(
//       //   padding: const EdgeInsets.only(
//       //     top: 8,
//       //     bottom: 4,
//       //     right: 8,
//       //     left: 8,
//       //   ),
//   //       child: TextFormField(
//   //         controller: textEditingController,
//   //         decoration: InputDecoration(
//   //           isDense: true,
//   //           contentPadding: const EdgeInsets.symmetric(
//   //             horizontal: 10,
//   //             vertical: 8,
//   //           ),
//   //           hintText: 'Search for an item...',
//   //           hintStyle: const TextStyle(fontSize: 12),
//   //           border: OutlineInputBorder(
//   //             borderRadius: BorderRadius.circular(8),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //     searchMatchFn: (item, searchValue) {
//   //       return (item.value
//   //           .toString()
//   //           .toLowerCase()
//   //           .contains(searchValue.toLowerCase()));
//   //     },
//   //     //This to clear the search value when you close the menu
//   //     onMenuStateChange: (isOpen) {
//   //       if (!isOpen) {
//   //         textEditingController.clear();
//   //       }
//   //     },
//   //   ),
//   // );
// }
