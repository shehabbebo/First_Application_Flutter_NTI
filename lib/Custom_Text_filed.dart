import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.contentPading,
    this.focusBorder,
    this.enableBorder,
    this.errorBorder,
    this.focusErrorBorder,
    this.inputTextStyle,
    required this.hintText,
    this.onSaved,
    this.onChange,
    this.isObscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    required this.validator,
    this.controller,
    this.keyboardType,
  });

  final EdgeInsetsGeometry? contentPading;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusErrorBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChange,
          onSaved: onSaved,
          obscureText: isObscureText,
          keyboardType: keyboardType,
          style: inputTextStyle,
          decoration: InputDecoration(
            filled: backgroundColor != null,
            fillColor: backgroundColor,
            isDense: true,
            contentPadding:
                contentPading ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xff929BAB),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: enableBorder ?? customBorder(),
            focusedBorder:
                focusBorder ?? customBorder(Colors.lightBlue.shade100),
            errorBorder: errorBorder ?? customBorder(Colors.red),
            focusedErrorBorder: focusErrorBorder ?? customBorder(Colors.red),
            errorStyle: const TextStyle(fontSize: 12),
          ),
          validator: validator,
        ),
      ),
    );
  }

  OutlineInputBorder customBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? const Color(0xffB2CCF),
        width: 1.5,
      ),
    );
  }
}
