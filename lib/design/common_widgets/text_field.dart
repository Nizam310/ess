import 'package:flutter/material.dart';

class CusTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final int? maxLines;

  const CusTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      required this.controller,
      required this.onChanged,
      this.maxLines})
      : super(key: key);

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(

          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 13,color: Colors.black),
          labelText: widget.labelText),
      onChanged: widget.onChanged,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
    );
  }
}
