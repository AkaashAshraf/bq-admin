import 'package:bq_admin/config/colors.dart';
import 'package:bq_admin/config/text_sizes.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SingleSelectionSimpleDropDown extends StatefulWidget {
  const SingleSelectionSimpleDropDown(
      {Key? key,
      required this.onChange,
      this.title = "",
      required this.selected,
      this.validator = "",
      this.hint = "",
      required this.items})
      : super(key: key);
  final String validator;
  final List<DropDown> items;
  final String title;
  final int selected;

  final String hint;
  final dynamic onChange;

  @override
  State<SingleSelectionSimpleDropDown> createState() =>
      _SingleSelectionSimpleDropDownState();
}

class _SingleSelectionSimpleDropDownState
    extends State<SingleSelectionSimpleDropDown> {
  List<int> selected = [];
  bool isObscure_ = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  DropdownSearch<DropDown>(
                    // dropdownButtonProps: const DropdownButtonProps(),
                    popupProps: const PopupProps.bottomSheet(),
                    items: widget.items,
                    selectedItem: widget.items.indexWhere(
                                (element) => element.value == widget.selected) >
                            -1
                        ? widget.items[widget.items.indexWhere(
                            (element) => element.value == widget.selected)]
                        : null,
                    itemAsString: (DropDown u) => u.title,
                    onChanged: (DropDown? data) => {widget.onChange(data)},
                    dropdownBuilder: ((context, selectedItem) => Text(
                          selectedItem?.title ?? "",
                          maxLines: 1,
                        )),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          labelText: widget.title, border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: width,
                    height: screenHeight(context) * 0.005,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          widget.hint,
                          maxLines: 1,
                          style: const TextStyle(
                              color: authTextInputHintColor,
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
    );
  }
}

class DropDown {
  String title;
  int value;
  DropDown({required this.title, required this.value});
}
