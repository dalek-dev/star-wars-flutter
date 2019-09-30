import 'dart:ffi';

import 'package:flutter/material.dart';

class CaracterPeople extends StatelessWidget {

  CaracterPeople(
      this.fieldTextFirst,
      this.fieldTextSecond,
      );

  final String fieldTextFirst;
  final String fieldTextSecond;

  static const colorStarWarsThird     = Color(0xFFFFFFFF);
  static const sizeFirst  = 18.0;
  static const sizeSecond = 16.0;
  static const String fontFamilyPeople = "StarWars";

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:10.0, left: 20.0),
          child: Text(
            fieldTextFirst,
            style: TextStyle(
              color: colorStarWarsThird,
              fontSize: sizeFirst,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0, left:10.0),
          child: Text(
            fieldTextSecond,
            style: TextStyle(
              color: colorStarWarsThird,
              fontFamily: fontFamilyPeople,
              fontSize: sizeSecond,
            ),
          ),
        ),
      ],
    );
  }
}
