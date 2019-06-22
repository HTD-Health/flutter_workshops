import 'package:flutter/material.dart';

class CompositionView extends StatefulWidget {
  final String title;
  CompositionView({Key key, this.title}) : super(key: key);

  _CompositionViewState createState() => _CompositionViewState();
}

class _CompositionViewState extends State<CompositionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(this.widget.title),
      ),
    );
  }
}
