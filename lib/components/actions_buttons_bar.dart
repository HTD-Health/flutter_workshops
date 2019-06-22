import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/action_button.dart';
import 'package:flutter_workshops/model/ingredient.dart';

class AnimationButtonsBar extends StatefulWidget {
  final List<Ingredient> buttons;
  AnimationButtonsBar({Key key, this.buttons}) : super(key: key);

  _AnimationButtonsBarState createState() => _AnimationButtonsBarState();
}

class _AnimationButtonsBarState extends State<AnimationButtonsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.buttons.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionButton(
              image: this.widget.buttons[index].image,
            ),
          );
        },
      ),
    );
  }
}
