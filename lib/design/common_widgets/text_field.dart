import 'package:flutter/material.dart';

class CusTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool? enabled;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final int? maxLines;
  final Color? borderColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? prefixColor;
  final Widget? prefix;
  final double? radius;
  final Color? textColor;
  const CusTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.controller,
      required this.onChanged,
      this.maxLines,
      this.enabled,
      this.borderColor,
      this.hintColor,
      this.fillColor,
      this.prefixColor,
      this.prefix,
      this.radius,
      this.textColor})
      : super(key: key);

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      style: TextStyle(color: widget.textColor ?? colorScheme.onPrimary),
      enabled: widget.enabled ?? true,
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.next,
      //style: TextStyle(color: Theme.of(context).colorScheme.surface),
      decoration: InputDecoration(
          fillColor: widget.fillColor,
          focusColor: widget.fillColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.outline)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.outline)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.outline)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 10),
            borderSide: BorderSide(
                color:
                    widget.borderColor ?? Theme.of(context).colorScheme.error),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.outline)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.outline)),
          prefixIcon: widget.prefix,
          prefixIconColor: widget.prefixColor,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 13,
              color:
                  widget.hintColor ?? Theme.of(context).colorScheme.onPrimary),
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          labelText: widget.labelText),
      onChanged: widget.onChanged,
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
    );
  }
}
