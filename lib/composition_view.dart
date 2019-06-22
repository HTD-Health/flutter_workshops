import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/action_button.dart';
import 'package:flutter_workshops/model/ingredient.dart';

import 'components/actions_buttons_bar.dart';

class CompositionView extends StatefulWidget {
  final String title;
  CompositionView({Key key, this.title}) : super(key: key);

  _CompositionViewState createState() => _CompositionViewState();
}

class _CompositionViewState extends State<CompositionView> {
  final List<Ingredient> _buttons = [
    Ingredient(image: 'images/bread.png'),
    Ingredient(image: 'images/ham.png'),
    Ingredient(image: 'images/salad.png'),
    Ingredient(image: 'images/cheese.png'),
    Ingredient(image: 'images/tomato.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          this.widget.title,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: AnimationButtonsBar(buttons: this._buttons),
      ),
    );
  }
}
