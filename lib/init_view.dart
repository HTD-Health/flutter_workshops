import 'package:flutter/material.dart';

class InitView extends StatelessWidget {
  const InitView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pan kanapka',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Image.asset('images/logo.png'),
      ),
    );
  }
}
