import 'package:flutter/widgets.dart';

const screenPadding = const EdgeInsets.symmetric(horizontal: 23);

class XBox extends StatelessWidget {
  const XBox(this._width);

  final double _width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}

class YBox extends StatelessWidget {
  const YBox(this._height);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}
