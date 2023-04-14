import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonTextColor;
  final double? buttonWidth;
  final Color? buttonColor;
  final double? fontSize;
  final FontWeight? buttonTextWeight;
  final bool Function()? validator;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonTextColor,
      this.validator,
      this.buttonTextWeight,
      this.buttonColor,
      this.fontSize,
      Key? key})
      : super(key: key);

  final double borderRadius = 3;

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: buttonWidth ?? phoneSize.width * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: (validator == null ? true : validator!())
            ? buttonColor ?? Colors.black
            : Colors.blueGrey,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 9, bottom: 9),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: (validator == null ? true : validator!()) ? onPressed : null,
        child: Text(
          text,
          style: TextStyle(
            color: buttonTextColor ?? Colors.white,
            fontSize: fontSize ?? 14,
            fontWeight: buttonTextWeight ?? FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
