import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final double width;
  final String text;
  final bool enable;
  final TextEditingController controller;

  const Field(
      {Key key,
      @required this.width,
      this.text,
      this.controller,
      this.enable = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$text'),
          SizedBox(height: 5),
          TextField(
            enabled: enable,
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
