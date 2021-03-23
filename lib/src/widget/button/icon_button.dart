import 'package:flutter/material.dart';

class IconMainButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String textButton;
  final Function onTap;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;

  const IconMainButton({
    Key key,
    this.width = 100,
    this.height = 50,
    this.borderRadius = 10,
    this.textButton = "",
    @required this.onTap,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.red,
    @required this.icon,
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
            child: Icon(
              icon,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
