import 'package:flutter/material.dart';

class CusTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CusTextField(
      {Key? key,
       this.hintText,
       this.labelText,
      required this.controller,
      required this.onChanged})
      : super(key: key);

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText
      ),
      onChanged: widget.onChanged,
      controller: widget.controller,
    );
  }
}
