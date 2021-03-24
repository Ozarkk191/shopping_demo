import 'package:flutter/material.dart';

class TextFieldBorderNone extends StatelessWidget {
  final double width;
  final String hintText;

  const TextFieldBorderNone({Key key, this.width, this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      width: width,
      child: TextField(
        decoration: InputDecoration(hintText: '$hintText'),
      ),
    );
  }
}
