import 'package:brew_crew/Templates/colors.dart';
import "package:flutter/material.dart";

OutlineInputBorder customFocusBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey[600]!));
}

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: milkColor!),
  );
}

final customInputDecoration = InputDecoration(
  //hintText: hintText,
  fillColor: milkColor,
  filled: true,
  border: customFocusBorder(),
  focusedBorder: customFocusBorder(),
  enabledBorder: customBorder(),
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  focusedErrorBorder: customFocusBorder(),
);
