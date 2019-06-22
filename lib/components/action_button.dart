import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String image;
  const ActionButton({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      child: RaisedButton(
        onPressed: () {},
        child: Image.asset(this.image),
        highlightColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
