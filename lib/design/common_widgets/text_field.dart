import 'package:flutter/material.dart';

class CusTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool? enabled;
  final TextEditingController controller;
  final Function(String) onChanged;
  final int? maxLines;
  final Color? borderColor;
  final Color? hintColor;

  const CusTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      required this.controller,
      required this.onChanged,
      this.maxLines,
      this.enabled,
      this.borderColor, this.hintColor})
      : super(key: key);

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled ?? true,
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFF3BBFC0))),
        enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFF3BBFC0))),
        focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFF3BBFC0))),
        errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.red),),
        disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFF3BBFC0))),
        focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFF3BBFC0))),
          hintText: widget.hintText,
          hintStyle:  TextStyle(fontSize: 13, color: widget.hintColor??Colors.black),
          labelText: widget.labelText),
      onChanged: widget.onChanged,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
    );
  }
}
