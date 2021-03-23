import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String textButton;
  final Function onTap;
  final Color textColor;
  final Color backgroundColor;

  const MainButton({
    Key key,
    this.width = 100,
    this.height = 50,
    this.borderRadius = 10,
    this.textButton = "",
    @required this.onTap,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: Center(
            child: Text(
              "$textButton",
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
