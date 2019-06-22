import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/actions_buttons_bar.dart';
import 'package:flutter_workshops/model/ingredient.dart';

class ElementsStack extends StatelessWidget {
  final List<Ingredient> elements;
  final double compressionValue;
  const ElementsStack({Key key, this.elements, this.compressionValue})
      : super(key: key);

  Widget _generate(int index) {
    return DragTarget<Ingredient>(
      builder: (BuildContext context, List<Ingredient> candidate,
          List<dynamic> rejected) {
        return Padding(
          padding: EdgeInsets.only(top: index * 90 * compressionValue),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: !this.elements[index].isVisible
                ? BoxDecoration(border: Border.all())
                : null,
            child: this.elements[index].isVisible
                ? ImageView(
                    image: this.elements[index].image,
                  )
                : null,
          ),
        );
      },
      onWillAccept: (_) => true,
      onAccept: (Ingredient element) {
        print(index);
        this.elements[index] = element..isVisible = true;
        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: List<Widget>.generate(this.elements.length, this._generate)
            .reversed
            .toList(),
      ),
    );
  }
}
