import 'main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class iconcontent extends StatelessWidget {
  iconcontent({this.icon,this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E98),

        ),
        ),
      ],
    );
  }
}