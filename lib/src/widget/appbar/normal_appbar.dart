import 'package:flutter/material.dart';

class NormalAppbar extends StatelessWidget {
  final String title;

  const NormalAppbar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.orange,
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                '$title',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
