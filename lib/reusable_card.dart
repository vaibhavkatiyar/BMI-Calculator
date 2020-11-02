import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour,this.cardChild,this.ompress});
  final Color colour;
  final Widget cardChild;
  final Function ompress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ompress,
      child: Container(
        child: cardChild,
        height: 200.0,
        width: 170.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}


