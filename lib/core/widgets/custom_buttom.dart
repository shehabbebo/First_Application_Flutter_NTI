import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff149954),
    this.textColor = Colors.white,
    this.height = 40,
    this.width = 300,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 5,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
