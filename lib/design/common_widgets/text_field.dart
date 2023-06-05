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
      this.borderColor,
      this.hintColor})
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
      style: TextStyle(color: Theme.of(context).colorScheme.surface),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color:
                    widget.borderColor ?? Theme.of(context).colorScheme.error),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary)),

          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 13,
              color: widget.hintColor ?? Theme.of(context).colorScheme.primary),
          labelStyle: TextStyle(
              color:  Theme.of(context).colorScheme.primary),
          labelText: widget.labelText),
      onChanged: widget.onChanged,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
    );
  }
}
