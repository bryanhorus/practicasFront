import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Circle extends StatelessWidget {
  final double raidius;
  final List<Color> colors;
  const Circle({Key key, @required this.raidius, @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: raidius * 2,
        height: raidius * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.raidius),
            gradient: LinearGradient(
                colors: this.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)));
  }
}
