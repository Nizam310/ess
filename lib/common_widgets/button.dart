import 'package:flutter/material.dart';

class CusButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final Color color;
  final Color? textColor;
  final double? textSize;
  const CusButton(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.color, this.textColor, this.textSize,
      })
      : super(key: key);

  @override
  State<CusButton> createState() => _CusButtonState();
}

class _CusButtonState extends State<CusButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 30,
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(color: widget.textColor,fontSize: widget.textSize),
        )),
      ),
    );
  }
}
