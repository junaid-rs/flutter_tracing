import 'dart:ui';

import 'package:flutter/material.dart';

class TraceModel {
  final bool isSpace;
  final String letterPath;
  final String pointsJsonFile;
  // final Color pointColor;
  final String dottedPath;
  final String indexPath;
final bool? disableDivededStrokes;
  final Color outerPaintColor;
  final Color innerPaintColor;
  final Color dottedColor;
  final Color indexColor;
  final double strokeWidth;

final PaintingStyle? indexPathPaintStyle;
final PaintingStyle? dottedPathPaintStyle;

final Size? poitionIndexPath;
final Size? poitionDottedPath;
final double? scaleIndexPath;
final double? scaledottedPath;
final double? distanceToCheck;
final Size  letterViewSize;
final double? strokeIndex;
  TraceModel({
        this.isSpace=false,

    this.letterViewSize=const Size(200,200),
    this.disableDivededStrokes,
    this.strokeIndex,
    this.distanceToCheck,
    this.scaledottedPath,
    this.scaleIndexPath,
    this.poitionIndexPath,    this.poitionDottedPath,

    this.indexPathPaintStyle,
    this.dottedPathPaintStyle,
    this.strokeWidth=55,
     this.indexColor = Colors.black,
    this.outerPaintColor = Colors.red,
    this.innerPaintColor = Colors.blue,
    this.dottedColor = Colors.amber,
    required this.dottedPath,
    required this.indexPath,
    required this.letterPath,
    required this.pointsJsonFile,
    // required this.pointColor,

  });

  TraceModel copyWith({
    bool? isSpace,
    String? letterPath,
    String? pointsJsonFile,
    String? dottedPath,
    String? indexPath,
    bool? disableDivededStrokes,
    Color? outerPaintColor,
    Color? innerPaintColor,
    Color? dottedColor,
    Color? indexColor,
    double? strokeWidth,
    PaintingStyle? indexPathPaintStyle,
    PaintingStyle? dottedPathPaintStyle,
    Size? poitionIndexPath,
    Size? poitionDottedPath,
    double? scaleIndexPath,
    double? scaledottedPath,
    double? distanceToCheck,
    Size? letterViewSize,
    double? strokeIndex,
  }) {
    return TraceModel(
      isSpace: isSpace ?? this.isSpace,
      letterPath: letterPath ?? this.letterPath,
      pointsJsonFile: pointsJsonFile ?? this.pointsJsonFile,
      dottedPath: dottedPath ?? this.dottedPath,
      indexPath: indexPath ?? this.indexPath,
      disableDivededStrokes: disableDivededStrokes ?? this.disableDivededStrokes,
      outerPaintColor: outerPaintColor ?? this.outerPaintColor,
      innerPaintColor: innerPaintColor ?? this.innerPaintColor,
      dottedColor: dottedColor ?? this.dottedColor,
      indexColor: indexColor ?? this.indexColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      indexPathPaintStyle: indexPathPaintStyle ?? this.indexPathPaintStyle,
      dottedPathPaintStyle: dottedPathPaintStyle ?? this.dottedPathPaintStyle,
      poitionIndexPath: poitionIndexPath ?? this.poitionIndexPath,
      poitionDottedPath: poitionDottedPath ?? this.poitionDottedPath,
      scaleIndexPath: scaleIndexPath ?? this.scaleIndexPath,
      scaledottedPath: scaledottedPath ?? this.scaledottedPath,
      distanceToCheck: distanceToCheck ?? this.distanceToCheck,
      letterViewSize: letterViewSize ?? this.letterViewSize,
      strokeIndex: strokeIndex ?? this.strokeIndex,
    );
  }
}
