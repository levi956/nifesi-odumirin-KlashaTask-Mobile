import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final double? size;
  final Color? color;
  final TextAlign? alignText;
  final FontStyle? fontStyle;

  const BaseText({
    super.key,
    required this.text,
    this.weight,
    this.size,
    this.color,
    this.alignText,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignText ?? TextAlign.start,
      overflow: TextOverflow.fade,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: color,
            fontWeight: weight,
            fontSize: size,
            fontStyle: fontStyle,
          ),
    );
  }
}
