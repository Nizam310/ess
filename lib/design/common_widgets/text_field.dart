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
      keyboardType: TextInputType.phone,

      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 13),
          labelText: widget.labelText),
      onChanged: widget.onChanged,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
    );
  }
}
