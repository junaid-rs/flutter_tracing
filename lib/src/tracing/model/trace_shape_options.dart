import 'package:flutter/material.dart';

class TraceShapeOptions {
  final Color outerPaintColor;
  final Color innerPaintColor;
  final Color dottedColor;
  final Color indexColor;

 const TraceShapeOptions({
    this.indexColor = Colors.black,
    this.outerPaintColor = Colors.red,
    this.innerPaintColor = Colors.blue,
    this.dottedColor = Colors.amber,
  });
}
