import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CusButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? hoverColor;
  final Color? textColor;
  final double? textSize;
  const CusButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize,
    this.hoverColor,
  }) : super(key: key);

  @override
  State<CusButton> createState() => _CusButtonState();
}

class _CusButtonState extends State<CusButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (val) {
        hover = true;
        setState(() {});
      },
      onExit: (val) {
        hover = false;
        setState(() {});
      },
      child: InkWell(
        highlightColor: const Color(0xFF717173),
        splashColor: const Color(0xFF717173),
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: hover == false
                ? (widget.color ?? Theme.of(context).colorScheme.primary)
                : (widget.hoverColor ?? Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(
                color: widget.textColor ?? Theme.of(context).colorScheme.onPrimary, fontSize: widget.textSize),
          )).paddingSymmetric(
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
