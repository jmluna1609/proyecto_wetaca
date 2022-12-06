import 'package:flutter/material.dart';

Widget textFieldIconEdit(
    String hintText,
    IconData icon,
    TextEditingController controller,
    TextInputType textInputType,
    String text,
    bool enabled) {
  controller.text = text;
  return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: TextField(
        enabled: enabled,
        obscureText:
            textInputType == TextInputType.visiblePassword ? true : false,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(23.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 199, 199, 199), width: 0.1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(23.0)),
            borderSide: BorderSide(color: Color(0xff2ba0bd), width: 1),
          ),
        ),
      ));
}
