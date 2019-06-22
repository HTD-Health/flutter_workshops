import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/action_button.dart';
import 'package:flutter_workshops/model/ingredient.dart';

class AnimationButtonsBar extends StatefulWidget {
  final List<Ingredient> buttons;
  AnimationButtonsBar({Key key, this.buttons}) : super(key: key);

  _AnimationButtonsBarState createState() => _AnimationButtonsBarState();
}

class _AnimationButtonsBarState extends State<AnimationButtonsBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  _changeSize(double size) {
    this._controller.animateTo(size);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.buttons.length,
        itemBuilder: (BuildContext context, int index) {
          return Draggable<Ingredient>(
            feedback: FeedbackItem(
              image: this.widget.buttons[index].image,
              controller: this._controller,
              minSize: 40,
              maxSize: 90,
            ),
            onDragStarted: () => _changeSize(1),
            onDragEnd: (_) => _changeSize(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActionButton(
                image: this.widget.buttons[index].image,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FeedbackItem extends AnimatedWidget {
  final String image;
  final double minSize;
  final double maxSize;
  const FeedbackItem({
    Key key,
    this.image,
    this.maxSize,
    this.minSize,
    AnimationController controller,
  }) : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    Animation<double> imageSize =
        Tween<double>(begin: this.minSize, end: this.maxSize).animate(
      CurvedAnimation(parent: this.listenable, curve: Interval(0.4, 1, curve: Curves.linear)),
    );
    return ImageView(
      image: this.image,
      size: imageSize.value,
    );
  }
}

class ImageView extends StatelessWidget {
  final double size;
  final String image;
  const ImageView({Key key, this.size, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size,
      width: this.size,
      child: Image.asset(this.image),
    );
  }
}
