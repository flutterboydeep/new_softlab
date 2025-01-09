import 'package:flutter/material.dart';

import '../const/colors.dart';

dropDownButton({
  required context,
  required controller,
  required List<String> listData,
  textFieldName = "",
  width = 180.0,
  isDropDwonContainer = false,
}) {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: const Color.fromARGB(196, 237, 236, 236),
      // border: Border(
      //     right: isDropDwonContainer==true
      //         ? BorderSide(color: greyColor, width: 1)
      //         : BorderSide.none)),
    ),
    // height: 40,
    child: ClipRRect(
      child: DropdownMenu(
        controller: controller,
        width: width,
        menuHeight: 150,
        textStyle: TextStyle(color: primary, fontSize: 16),
        inputDecorationTheme: InputDecorationTheme(
            constraints: BoxConstraints(maxHeight: 57),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none)),
        initialSelection: listData[0],
        dropdownMenuEntries: listData.map((e) {
          return DropdownMenuEntry(value: e, label: e);
        }).toList(),
        enableFilter: false,
      ),
    ),
  );
}
