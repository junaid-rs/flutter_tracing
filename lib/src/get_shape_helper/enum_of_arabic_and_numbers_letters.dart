import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tracing/src/phontics_constants/numbers_svg.dart';
import 'package:tracing/src/tracing/model/trace_model.dart';
import 'package:tracing/tracing.dart';

enum ArabicLetters {
  gem,
  sen,
  lam,
  ra2,
  ba2,
  fa2,
  mem,
  ein,
  tah,
  alf,
  kha2,
  theh,
  sad,
  ya2,
  ha2,
  dal,
  tha2,
  waw,
  // kaf el be hamza
  kaf,
  zen,
  // vilot

  ta2,
  ghen,
  dad,
  zal,

  shen,
  // qaf el be no2teten
  qaf,

  non,

  heh1,
  heh2,
}

enum MathShapes {
  circle,
  triangle,
  rectangle,
}

enum PhonicsLetters {
  s,
  a,
  f,
  m,
  t,
  c,
  i,
  r,
  p,
  h,
  j,
  u,
  l,
  b,
  o,
  g,
  d,
  w,
  e,
  n,
  k,
  q,
  v,
  x,
  y,
  z,
}

enum StateOfTracing {
  arabic,
  phonics,
  math,
  phonicsUp,
  practicalLife,
  traceWords,
  traceShapes
}

class TypeExtensionTracking {
  ArabicLetters _detectTheCurrentEnum({required String letter}) {
    if (letter == 'هـ') {
      return ArabicLetters.heh1;
    } else if (letter == 'ه') {
      return ArabicLetters.heh2;
    } else if (letter == 'ن') {
      return ArabicLetters.non;
    } else if (letter == 'ق') {
      return ArabicLetters.qaf;
    } else if (letter == 'ش') {
      return ArabicLetters.shen;
    } else if (letter == 'ز') {
      return ArabicLetters.zen;
    } else if (letter == 'ذ') {
      return ArabicLetters.zal;
    } else if (letter == 'ض') {
      return ArabicLetters.dad;
    } else if (letter == 'غ') {
      return ArabicLetters.ghen;
    } else if (letter == 'ت') {
      return ArabicLetters.ta2;
    } else if (letter == 'ك') {
      return ArabicLetters.kaf;
    } else if (letter == 'و') {
      return ArabicLetters.waw;
    } else if (letter == 'ظ') {
      return ArabicLetters.tha2;
    } else if (letter == 'د') {
      return ArabicLetters.dal;
    } else if (letter == 'ح') {
      return ArabicLetters.ha2;
    } else if (letter == 'ي') {
      return ArabicLetters.ya2;
    } else if (letter == 'ص') {
      return ArabicLetters.sad;
    } else if (letter == 'ث') {
      return ArabicLetters.theh;
    } else if (letter == 'خ') {
      return ArabicLetters.kha2;
    } else if (letter == 'أ') {
      return ArabicLetters.alf;
    } else if (letter == 'ط') {
      return ArabicLetters.tah;
    } else if (letter == 'ع') {
      return ArabicLetters.ein;
    } else if (letter == 'م') {
      return ArabicLetters.mem;
    } else if (letter == 'ف') {
      return ArabicLetters.fa2;
    } else if (letter == 'ج') {
      return ArabicLetters.gem;
    } else if (letter == 'س') {
      return ArabicLetters.sen;
    } else if (letter == 'ل') {
      return ArabicLetters.lam;
    } else if (letter == 'ر') {
      return ArabicLetters.ra2;
    } else if (letter == 'ب') {
      return ArabicLetters.ba2;
    } else {
      return ArabicLetters.gem;
    }
  }

  MathShapes _detectTheCurrentEnumMathShapes({required String shape}) {
    if (shape == 'circle') {
      return MathShapes.circle;
    } else if (shape == 'rectangle') {
      return MathShapes.rectangle;
    } else if (shape == 'triangle') {
      return MathShapes.triangle;
    }
    return MathShapes.circle;
  }

  PhonicsLetters _detectTheCurrentEnumFromPhonics({required String letter}) {
    print('/////');
    print(letter.toString());
    if (letter == 'a') {
      return PhonicsLetters.a;
    } else if (letter == 'q') {
      return PhonicsLetters.q;
    } else if (letter == 'w') {
      return PhonicsLetters.w;
    } else if (letter == 'e') {
      return PhonicsLetters.e;
    } else if (letter == 'r') {
      return PhonicsLetters.r;
    } else if (letter == 't') {
      return PhonicsLetters.t;
    } else if (letter == 'y') {
      return PhonicsLetters.y;
    } else if (letter == 'u') {
      return PhonicsLetters.u;
    } else if (letter == 'i') {
      return PhonicsLetters.i;
    } else if (letter == 'o') {
      return PhonicsLetters.o;
    } else if (letter == 'p') {
      return PhonicsLetters.p;
    } else if (letter == 's') {
      return PhonicsLetters.s;
    } else if (letter == 'd') {
      return PhonicsLetters.d;
    } else if (letter == 'f') {
      return PhonicsLetters.f;
    } else if (letter == 'g') {
      return PhonicsLetters.g;
    } else if (letter == 'h') {
      return PhonicsLetters.h;
    } else if (letter == 'j') {
      return PhonicsLetters.j;
    } else if (letter == 'k') {
      return PhonicsLetters.k;
    } else if (letter == 'l') {
      return PhonicsLetters.l;
    } else if (letter == 'z') {
      return PhonicsLetters.z;
    } else if (letter == 'x') {
      return PhonicsLetters.x;
    } else if (letter == 'c') {
      return PhonicsLetters.c;
    } else if (letter == 'v') {
      return PhonicsLetters.v;
    } else if (letter == 'b') {
      return PhonicsLetters.b;
    } else if (letter == 'n') {
      return PhonicsLetters.n;
    } else if (letter == 'm') {
      return PhonicsLetters.m;
    } else {
      return PhonicsLetters.m;
    }
  }

  List<TraceModel> getTracingDataNumbers({required String number}) {
    print('getTracingDataNumbers:$number');
    List<TraceModel> listOfTraceModel = [];

    for (int i = 0; i < number.length; i++) {
      switch (number[i]) {
        case '1':
          if (number[i] == '1' && number[i + 1] == '0') {
            // 10 condition
            listOfTraceModel.add(
              TraceModel(
                  poitionIndexPath: const Size(-28, -90),
                  poitionDottedPath: const Size(-3, 0),
                  scaledottedPath: .9,
                  scaleIndexPath: .55,
                  dottedColor: AppColorPhonetics.phonticGrey,
                  indexColor: AppColorPhonetics.white,
                  dottedPath: NumberSvgs.shapeNumber10Dotted,
                  indexPath: NumberSvgs.shapeNumber10Index,
                  letterPath: NumberSvgs.shapeNumber10,
                  indexPathPaintStyle: PaintingStyle.fill,
                  strokeWidth: 45,
                  pointsJsonFile: ShapePointsManger.number10,
                  innerPaintColor: AppColorPhonetics.lightBlueColor6,
                  outerPaintColor: AppColorPhonetics.lightBlueColor5),
            );

            break;
          } else
            listOfTraceModel.add(TraceModel(
                poitionIndexPath: const Size(-12, -85),
                poitionDottedPath: const Size(-31, 10),
                scaledottedPath: .8,
                scaleIndexPath: .1,
                dottedColor: AppColorPhonetics.phonticGrey,
                indexColor: AppColorPhonetics.white,
                dottedPath: NumberSvgs.shapeNumber1Dotted,
                indexPath: NumberSvgs.shapeNumber1Index,
                letterPath: NumberSvgs.shapeNumber1,
                indexPathPaintStyle: PaintingStyle.fill,
                dottedPathPaintStyle: PaintingStyle.stroke,
                pointsJsonFile: ShapePointsManger.number1,
                innerPaintColor: AppColorPhonetics.lightBlueColor6,
                outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '2':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(-50, 20),
              poitionDottedPath: const Size(0, -5),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .8,
              scaledottedPath: 1,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber2Dotted,
              indexPath: NumberSvgs.shapeNumber2Index,
              letterPath: NumberSvgs.shapeNumber2,
              pointsJsonFile: ShapePointsManger.number2,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '3':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(-25, -30),
              poitionDottedPath: const Size(-5, 0),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .4,
              scaledottedPath: .9,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber3Dotted,
              indexPath: NumberSvgs.shapeNumber3Index,
              letterPath: NumberSvgs.shapeNumber3,
              pointsJsonFile: ShapePointsManger.number3,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '4':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(-10, -33),
              poitionDottedPath: const Size(-3, -10),
              scaledottedPath: .85,
              disableDivededStrokes: true,
              scaleIndexPath: .66,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber4Dotted,
              indexPath: NumberSvgs.shapeNumber4Index,
              letterPath: NumberSvgs.shapeNumber4,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              strokeWidth: 35,
              // distanceToCheck: 10,
              pointsJsonFile: ShapePointsManger.number4,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '5':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(-30, -50),
              poitionDottedPath: const Size(-5, 0),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .5,
              scaledottedPath: .95,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber5Dotted,
              indexPath: NumberSvgs.shapeNumber5Index,
              letterPath: NumberSvgs.shapeNumber5,
              pointsJsonFile: ShapePointsManger.number5,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '6':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(5, -90),
              poitionDottedPath: const Size(-5, 0),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .1,
              scaledottedPath: .9,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber6Dotted,
              indexPath: NumberSvgs.shapeNumber6Index,
              letterPath: NumberSvgs.shapeNumber6,
              pointsJsonFile: ShapePointsManger.number6,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '7':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(0, -90),
              poitionDottedPath: const Size(0, -5),
              scaledottedPath: .9,
              scaleIndexPath: .6,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber7Dotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: NumberSvgs.shapeNumber7Index,
              letterPath: NumberSvgs.shapeNumber7,
              strokeWidth: 45,
              pointsJsonFile: ShapePointsManger.number7,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '8':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(50, -50),
              poitionDottedPath: const Size(5, 0),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .07,
              scaledottedPath: 1,
              strokeWidth: 40,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber8Dotted,
              indexPath: NumberSvgs.shapeNumber8Index,
              letterPath: NumberSvgs.shapeNumber8,
              pointsJsonFile: ShapePointsManger.number8,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '9':
          listOfTraceModel.add(TraceModel(
              poitionIndexPath: const Size(55, -30),
              poitionDottedPath: const Size(0, -5),
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              scaleIndexPath: .18,
              scaledottedPath: .9,
              strokeWidth: 45,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              dottedPath: NumberSvgs.shapeNumber9Dotted,
              indexPath: NumberSvgs.shapeNumber9Index,
              letterPath: NumberSvgs.shapeNumber9,
              pointsJsonFile: ShapePointsManger.number9,
              innerPaintColor: AppColorPhonetics.lightBlueColor6,
              outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
        case '10':
          listOfTraceModel.add(
            TraceModel(
                poitionIndexPath: const Size(-28, -90),
                poitionDottedPath: const Size(-3, 0),
                scaledottedPath: .9,
                scaleIndexPath: .55,
                dottedColor: AppColorPhonetics.phonticGrey,
                indexColor: AppColorPhonetics.white,
                dottedPath: NumberSvgs.shapeNumber10Dotted,
                indexPath: NumberSvgs.shapeNumber10Index,
                letterPath: NumberSvgs.shapeNumber10,
                indexPathPaintStyle: PaintingStyle.fill,
                strokeWidth: 45,
                pointsJsonFile: ShapePointsManger.number10,
                innerPaintColor: AppColorPhonetics.lightBlueColor6,
                outerPaintColor: AppColorPhonetics.lightBlueColor5),
          );
        case '0':
          if (number.length < 2 && number[number.length - 1] == '0')
            listOfTraceModel.add(TraceModel(
                poitionIndexPath: const Size(-10, -90),
                poitionDottedPath: const Size(-5, -5),
                scaledottedPath: .9,
                scaleIndexPath: .08,
                indexPathPaintStyle: PaintingStyle.fill,
                dottedColor: AppColorPhonetics.phonticGrey,
                indexColor: AppColorPhonetics.white,
                dottedPath: NumberSvgs.shapeNumber0Dotted,
                indexPath: NumberSvgs.shapeNumber0Index,
                letterPath: NumberSvgs.shapeNumber0,
                pointsJsonFile: ShapePointsManger.number0,
                innerPaintColor: AppColorPhonetics.lightBlueColor6,
                outerPaintColor: AppColorPhonetics.lightBlueColor5));
          break;
      }
    }

    return listOfTraceModel;
  }

  List<TraceModel> getTracingData(
      {required String letter, required StateOfTracing currentOfTracking}) {
    if (currentOfTracking == StateOfTracing.traceShapes) {
      return getTracingDataMathShapes(shape: letter);
    } else if (currentOfTracking == StateOfTracing.traceWords) {
      return getTraceWords(word: letter);
    } else if (currentOfTracking == StateOfTracing.arabic) {
      return getTracingDataArabic(letter: letter);
    } else if (currentOfTracking == StateOfTracing.math) {
      return getTracingDataNumbers(number: letter);
    } else if (currentOfTracking == StateOfTracing.phonics) {
      return getTracingDataPhonics(letter: letter.toLowerCase());
    } else if (currentOfTracking == StateOfTracing.phonicsUp) {
      return getTracingDataPhonicsUp(letter: letter.toLowerCase());
    } else {
      return [];
    }
  }

  List<TraceModel> getTracingDataMathShapes({required String shape}) {
    MathShapes currentLetter = _detectTheCurrentEnumMathShapes(shape: shape);

    switch (currentLetter) {
      case MathShapes.circle:
        final circ = TraceModel(
            letterViewSize: Size(200, 200),
            poitionIndexPath: const Size(100, -60),
            poitionDottedPath: const Size(0, 0),
            scaledottedPath: .9,
            scaleIndexPath: .4,
            indexPathPaintStyle: PaintingStyle.stroke,
            dottedPath: MathTraceShapePaths.circleDottedPath,
            dottedColor: Colors.black,
            indexColor: AppColorPhonetics.phonticGrey,
            indexPath: MathTraceShapePaths.circleIndexPath,
            letterPath: MathTraceShapePaths.circleShapePath,
            strokeWidth: 30,
            strokeIndex: 1,
            pointsJsonFile: ShapePointsManger.mathCircleShape,
            innerPaintColor: AppColorPhonetics.lightBlueColor4,
            outerPaintColor: Colors.transparent);
        return [
          circ.copyWith(
            letterViewSize: Size(165, 165),
          ),
          circ.copyWith(
            letterViewSize: Size(150, 150),
          ),
          circ.copyWith(
            letterViewSize: Size(125, 125),
          ),
          circ.copyWith(
            letterViewSize: Size(200, 200),
          ),
        ];

      case MathShapes.rectangle:
        final rect = TraceModel(
            letterViewSize: Size(200, 200),
            poitionIndexPath: const Size(0, 15),
            poitionDottedPath: const Size(10, -7),
            scaledottedPath: .95,
            scaleIndexPath: 1.4,
            indexPathPaintStyle: PaintingStyle.stroke,
            dottedPath: MathTraceShapePaths.rectangleDottedPath,
            dottedColor: Colors.black,
            indexColor: AppColorPhonetics.phonticGrey,
            indexPath: MathTraceShapePaths.rectangleIndexPath,
            letterPath: MathTraceShapePaths.rectangleShapePath,
            strokeWidth: 30,
            strokeIndex: 1,
            pointsJsonFile: ShapePointsManger.rectangleShape,
            innerPaintColor: AppColorPhonetics.lightBlueColor4,
            outerPaintColor: Colors.transparent);
        return [
          rect.copyWith(
            letterViewSize: Size(125, 125),
          ),
          rect.copyWith(
            letterViewSize: Size(150, 150),
          ),
          rect.copyWith(
            letterViewSize: Size(140, 140),
          ),
          rect.copyWith(
            letterViewSize: Size(160, 160),
          ),
        ];

      case MathShapes.triangle:
        return [
          TraceModel(
              letterViewSize: Size(150, 150),
              poitionIndexPath: const Size(-10, 10),
              poitionDottedPath: const Size(-5, 3),
              scaledottedPath: .85,
              scaleIndexPath: 1.25,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: MathTraceShapePaths.triangle4DottedPath,
              dottedColor: Colors.black,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: MathTraceShapePaths.triangle4IndexPath,
              letterPath: MathTraceShapePaths.triangle4ShapePath,
              strokeWidth: 35,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.triangle4Shape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: Colors.transparent),
          TraceModel(
              letterViewSize: Size(180, 180),
              poitionIndexPath: const Size(-8, 10),
              poitionDottedPath: const Size(0, 3),
              scaledottedPath: .9,
              scaleIndexPath: 1.17,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: MathTraceShapePaths.triangle3DottedPath,
              dottedColor: Colors.black,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: MathTraceShapePaths.triangle3Index,
              letterPath: MathTraceShapePaths.triangle3ShapePath,
              strokeWidth: 40,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.triangle3Shape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: Colors.transparent),
          TraceModel(
              letterViewSize: Size(160, 160),
              poitionIndexPath: const Size(5, 0),
              poitionDottedPath: const Size(-5, 3),
              scaledottedPath: .85,
              scaleIndexPath: 1.1,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: MathTraceShapePaths.triangle2DottedPath,
              dottedColor: Colors.black,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: MathTraceShapePaths.triangle2IndexPath,
              letterPath: MathTraceShapePaths.triangle2ShapePath,
              strokeWidth: 30,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.triangle2Shape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: Colors.transparent),
          TraceModel(
              letterViewSize: Size(150, 150),
              poitionIndexPath: const Size(-5, 10),
              poitionDottedPath: const Size(0, 3),
              scaledottedPath: .9,
              scaleIndexPath: 1.14,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: MathTraceShapePaths.triangle1DottedPath,
              dottedColor: Colors.black,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: MathTraceShapePaths.triangle1IndexPath,
              letterPath: MathTraceShapePaths.triangle1ShapePath,
              strokeWidth: 30,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.triangle1Shape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: Colors.transparent),
        ];

      default:
        return [
          TraceModel(
              poitionIndexPath: const Size(5, 0),
              poitionDottedPath: const Size(0, 15),
              scaledottedPath: .75,
              scaleIndexPath: 1.2,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePathBluUnit.heh3Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh3Index,
              letterPath: ArabicShapePathBluUnit.heh3Shape,
              strokeWidth: 60,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.heh3,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(-5, -15),
              poitionDottedPath: const Size(0, 0),
              scaledottedPath: .75,
              scaleIndexPath: 1.2,
              strokeIndex: 1,
              disableDivededStrokes: true,
              strokeWidth: 50,
              dottedPath: ArabicShapePathBluUnit.heh4Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh4Index,
              letterPath: ArabicShapePathBluUnit.heh4Shape,
              pointsJsonFile: ShapePointsManger.heh4,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
    }
  }

  List<TraceModel> getTraceWords(
      {required String word, Size sizeOfLetter = const Size(500, 500)}) {
    List<TraceModel> letters = [];
    for (var i = 0; i < word.length; i++) {
      if (word[i] != ' ') {
        bool isNextSpace = (i + 1 < word.length) &&
            word[i + 1] == ' '; // Check if the next character is a space

        if (i == 0) {
          letters.add(
            getTracingDataPhonicsUp(
              letter: word[i],
            ).first.copyWith(
                  isSpace: isNextSpace,
                  letterViewSize: sizeOfLetter,
                  dottedColor: AppColorPhonetics.white,
                  indexColor: AppColorPhonetics.phonticGrey,
                ),
          );
        } else {
          letters.add(
            getTracingDataPhonics(
              letter: word[i],
            ).first.copyWith(
                  isSpace: isNextSpace,
                  letterViewSize: sizeOfLetter,
                  dottedColor: AppColorPhonetics.white,
                  indexColor: AppColorPhonetics.phonticGrey,
                ),
          );
        }
      }
    }
    return letters;
  }

  List<TraceModel> getTracingDataArabic({required String letter}) {
    ArabicLetters currentLetter = _detectTheCurrentEnum(letter: letter);

    switch (currentLetter) {
      case ArabicLetters.heh2:
// heh 2
        return [
          TraceModel(
              poitionIndexPath: const Size(5, 0),
              poitionDottedPath: const Size(0, 15),
              scaledottedPath: .75,
              scaleIndexPath: 1.2,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePathBluUnit.heh3Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh3Index,
              letterPath: ArabicShapePathBluUnit.heh3Shape,
              strokeWidth: 60,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.heh3,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(-5, -15),
              poitionDottedPath: const Size(0, 0),
              scaledottedPath: .75,
              scaleIndexPath: 1.2,
              strokeIndex: 1,
              disableDivededStrokes: true,
              strokeWidth: 50,
              dottedPath: ArabicShapePathBluUnit.heh4Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh4Index,
              letterPath: ArabicShapePathBluUnit.heh4Shape,
              pointsJsonFile: ShapePointsManger.heh4,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.heh1:
        return [
          TraceModel(
              poitionIndexPath: const Size(10, 0),
              poitionDottedPath: const Size(-5, 7),
              scaledottedPath: .85,
              scaleIndexPath: 1.2,
              strokeIndex: 1,
              disableDivededStrokes: true,
              strokeWidth: 45,
              dottedPath: ArabicShapePathBluUnit.heh1Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh1Index,
              letterPath: ArabicShapePathBluUnit.heh1Shape,
              pointsJsonFile: ShapePointsManger.heh1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(10, -10),
              poitionDottedPath: const Size(10, 0),
              scaledottedPath: .85,
              scaleIndexPath: 1.05,
              strokeIndex: 1,
              disableDivededStrokes: true,
              strokeWidth: 45,
              dottedPath: ArabicShapePathBluUnit.heh2Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.heh2Index,
              letterPath: ArabicShapePathBluUnit.heh2Shape,
              pointsJsonFile: ShapePointsManger.heh2,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.non:
        return [
          TraceModel(
              poitionIndexPath: const Size(5, 25),
              poitionDottedPath: const Size(0, 15),
              scaledottedPath: .67,
              scaleIndexPath: 1,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePathBluUnit.nonBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.nonBigShapeIndex,
              letterPath: ArabicShapePathBluUnit.nonBigShape,
              strokeWidth: 40,
              strokeIndex: 1,
              disableDivededStrokes: true,
              pointsJsonFile: ShapePointsManger.nonBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              disableDivededStrokes: true,
              poitionIndexPath: const Size(20, 40),
              poitionDottedPath: const Size(-5, 38),
              scaledottedPath: .65,
              scaleIndexPath: .8,
              strokeIndex: 1,
              strokeWidth: 45,
              dottedPath: ArabicShapePathBluUnit.nonSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.nonSmallIndex,
              letterPath: ArabicShapePathBluUnit.nonSmallShape,
              pointsJsonFile: ShapePointsManger.nonSmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.qaf:
        return [
          TraceModel(
              poitionIndexPath: const Size(0, 20),
              poitionDottedPath: const Size(0, 20),
              scaledottedPath: .67,
              scaleIndexPath: .9,
              strokeWidth: 35,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePathBluUnit.QaaaafBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.QaaaafBigIndex,
              letterPath: ArabicShapePathBluUnit.QaaaafBigShape,
              pointsJsonFile: ShapePointsManger.qafBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(20, 30),
              poitionDottedPath: const Size(0, 30),
              scaledottedPath: .6,
              scaleIndexPath: .9,
              strokeWidth: 40,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePathBluUnit.qaafSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePathBluUnit.QaaaafSmallIndex,
              letterPath: ArabicShapePathBluUnit.QaaaafSmallShape,
              pointsJsonFile: ShapePointsManger.qafSmallShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.shen:
        return [
          TraceModel(
              poitionIndexPath: const Size(0, 25),
              poitionDottedPath: const Size(0, 25),
              scaledottedPath: .95,
              scaleIndexPath: 1.2,
              disableDivededStrokes: true,
              strokeWidth: 28,
              distanceToCheck: 15,
              dottedPath: ArabicShapePaths.shenBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.shenBigIndex,
              letterPath: ArabicShapePaths.shenBigShape,
              pointsJsonFile: ShapePointsManger.shenBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(5, 25),
              poitionDottedPath: const Size(0, 25),
              scaledottedPath: .95,
              scaleIndexPath: 1.1,
              strokeWidth: 30,
              distanceToCheck: 15,
              dottedPath: ArabicShapePaths.shenSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.shenSmallIndex,
              strokeIndex: 1,
              disableDivededStrokes: true,
              letterPath: ArabicShapePaths.shenSmallShape,
              pointsJsonFile: ShapePointsManger.shenSmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.zen:
        return [
          TraceModel(
              strokeIndex: 1,
              dottedPath: ArabicShapePaths.zenDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.zenIndex,
              letterPath: ArabicShapePaths.zenBig,
              poitionIndexPath: const Size(50, 40),
              poitionDottedPath: const Size(15, 40),
              scaleIndexPath: .8,
              scaledottedPath: .55,
              pointsJsonFile: ShapePointsManger.zenBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.zal:
        return [
          TraceModel(
              poitionIndexPath: const Size(30, 30),
              poitionDottedPath: const Size(5, 25),
              scaledottedPath: .57,
              scaleIndexPath: .9,
              strokeWidth: 50,
              disableDivededStrokes: true,
              distanceToCheck: 40,
              dottedPath: ArabicShapePaths.zalDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.zalIndex,
              letterPath: ArabicShapePaths.zalBigShape,
              pointsJsonFile: ShapePointsManger.zalBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.dad:
        return [
          TraceModel(
              dottedPath: ArabicShapePaths.dadBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.dadBigIndex,
              letterPath: ArabicShapePaths.dadBigShape,
              strokeIndex: 1,
              strokeWidth: 30,
              poitionIndexPath: const Size(5, 10),
              poitionDottedPath: const Size(0, 15),
              scaleIndexPath: 1.1,
              scaledottedPath: .92,
              pointsJsonFile: ShapePointsManger.dadBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              dottedPath: ArabicShapePaths.dadSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.dadSmallIndex,
              letterPath: ArabicShapePaths.dadSmallShape,
              poitionIndexPath: const Size(15, 10),
              strokeIndex: 1,
              strokeWidth: 30,
              poitionDottedPath: const Size(0, 15),
              scaleIndexPath: 1.1,
              scaledottedPath: .95,
              pointsJsonFile: ShapePointsManger.dadsmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.ghen:
        return [
          TraceModel(
              poitionIndexPath: const Size(-18, 10),
              poitionDottedPath: const Size(0, 15),
              scaledottedPath: .75,
              scaleIndexPath: .85,
              strokeWidth: 33,
              dottedPath: ArabicShapePaths.ghenBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ghenBigIndex,
              letterPath: ArabicShapePaths.ghenBigShape,
              pointsJsonFile: ShapePointsManger.ghenbigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(30, 35),
              poitionDottedPath: const Size(5, 30),
              scaledottedPath: .75,
              scaleIndexPath: .9,
              strokeWidth: 45,
              dottedPath: ArabicShapePaths.ghenSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ghenSmallIndex,
              letterPath: ArabicShapePaths.ghenSmallShape,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.ghensmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.ta2:
        return [
          TraceModel(
              poitionIndexPath: const Size(10, 25),
              poitionDottedPath: const Size(5, 15),
              scaledottedPath: .93,
              scaleIndexPath: 1.1,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.ta2BigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ta2BigIndex,
              letterPath: ArabicShapePaths.ta2BigShape,
              strokeWidth: 35,
              strokeIndex: 1,
              disableDivededStrokes: true,
              pointsJsonFile: ShapePointsManger.ta2BigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              disableDivededStrokes: true,
              poitionIndexPath: const Size(50, 40),
              poitionDottedPath: const Size(5, 30),
              scaledottedPath: .82,
              scaleIndexPath: .8,
              strokeIndex: 1,
              strokeWidth: 45,
              dottedPath: ArabicShapePaths.ta2SmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ta2SmallIndex,
              letterPath: ArabicShapePaths.ta2SmalShape,
              pointsJsonFile: ShapePointsManger.ta2SmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.gem:

        // TODO RETURN THIS BACK

        return [
          TraceModel(
              poitionIndexPath: const Size(-10, -18),
              poitionDottedPath: const Size(0, -5),
              scaledottedPath: .9,
              scaleIndexPath: .92,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.gemDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.gemIndex,
              letterPath: ArabicShapePaths.gemmm,
              strokeWidth: 40,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.gemShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(0, -30),
              poitionDottedPath: const Size(-5, -15),
              scaledottedPath: .8,
              scaleIndexPath: .9,
              strokeIndex: 1,

              // strokeWidth: ,
              dottedPath: ArabicShapePaths.gemsmallDoottedPath,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.gemSmallIndexPath,
              letterPath: ArabicShapePaths.gemSmall2,
              pointsJsonFile: ShapePointsManger.gemSmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.kaf:
        return [
          TraceModel(
              poitionIndexPath: const Size(0, 20),
              poitionDottedPath: const Size(8, 20),
              scaledottedPath: .8,
              scaleIndexPath: 1.05,
              strokeWidth: 45,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.kafBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.kafBigIndex,
              letterPath: ArabicShapePaths.kafBigshape,
              pointsJsonFile: ShapePointsManger.kafBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(0, 0),
              poitionDottedPath: const Size(-10, 0),
              scaledottedPath: .9,
              scaleIndexPath: 1.15,
              strokeWidth: 40,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.kafSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.kafSmallIndex,
              letterPath: ArabicShapePaths.kafSmallshape,
              pointsJsonFile: ShapePointsManger.kafSmallShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.waw:
        return [
          TraceModel(
              poitionIndexPath: const Size(15, -5),
              poitionDottedPath: const Size(5, 5),
              scaledottedPath: .9,
              scaleIndexPath: 1.15,
              strokeWidth: 40,
              disableDivededStrokes: true,
              distanceToCheck: 40,
              dottedPath: ArabicShapePaths.wawDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.wawIndex,
              letterPath: ArabicShapePaths.wawBigShape,
              pointsJsonFile: ShapePointsManger.wawBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.tha2:
        return [
          TraceModel(
              poitionIndexPath: const Size(20, 20),
              poitionDottedPath: const Size(20, 15),
              scaledottedPath: .75,
              scaleIndexPath: .9,
              strokeWidth: 40,
              disableDivededStrokes: true,
              distanceToCheck: 40,
              dottedPath: ArabicShapePaths.tha2Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.tha2Index,
              letterPath: ArabicShapePaths.tha2BigShape,
              pointsJsonFile: ShapePointsManger.tha2BigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.dal:
        return [
          TraceModel(
              poitionIndexPath: const Size(40, 0),
              poitionDottedPath: const Size(5, 10),
              scaledottedPath: .85,
              scaleIndexPath: 1.1,
              strokeWidth: 50,
              disableDivededStrokes: true,
              distanceToCheck: 45,
              dottedPath: ArabicShapePaths.dalDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.dalBigIndex,
              letterPath: ArabicShapePaths.dalBigshape,
              pointsJsonFile: ShapePointsManger.dalBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.ha2:
        return [
          TraceModel(
              poitionIndexPath: const Size(-10, -20),
              poitionDottedPath: const Size(-10, -2),
              scaledottedPath: .87,
              scaleIndexPath: .9,
              strokeWidth: 35,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.ha2Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ha2Index,
              letterPath: ArabicShapePaths.ha2Bigshape,
              pointsJsonFile: ShapePointsManger.ha2BigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(0, 0),
              poitionDottedPath: const Size(0, 5),
              scaledottedPath: .87,
              scaleIndexPath: .9,
              strokeWidth: 35,
              disableDivededStrokes: true,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.ha2SmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ha2SmallIndex,
              letterPath: ArabicShapePaths.ha2SmallShape,
              pointsJsonFile: ShapePointsManger.ha2SmallShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.ya2:
        return [
          TraceModel(
              poitionIndexPath: const Size(25, -28),
              poitionDottedPath: const Size(0, -24),
              scaledottedPath: .67,
              scaleIndexPath: .92,
              strokeWidth: 40,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.ya2BigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ya2BigIndex,
              letterPath: ArabicShapePaths.ya2Big,
              pointsJsonFile: ShapePointsManger.ya2bigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              distanceToCheck: 30,
              poitionIndexPath: const Size(33, -40),
              poitionDottedPath: const Size(10, -40),
              scaledottedPath: .67,
              scaleIndexPath: .8,
              strokeWidth: 50,
              dottedPath: ArabicShapePaths.ya2SmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ya2SmallIndex,
              strokeIndex: 1,
              letterPath: ArabicShapePaths.ya2Small,
              pointsJsonFile: ShapePointsManger.ya2smallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.sad:
        return [
          TraceModel(
              poitionIndexPath: const Size(0, 0),
              poitionDottedPath: const Size(0, 2),
              scaledottedPath: .92,
              scaleIndexPath: 1.1,
              strokeWidth: 28,
              dottedPath: ArabicShapePaths.sadBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.sadBigIndex,
              letterPath: ArabicShapePaths.sadBigShape,
              pointsJsonFile: ShapePointsManger.sadBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(15, -10),
              poitionDottedPath: const Size(0, 2),
              scaledottedPath: .92,
              scaleIndexPath: 1,
              strokeWidth: 22,
              dottedPath: ArabicShapePaths.sadSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.sadSmallIndex,
              strokeIndex: 1,
              disableDivededStrokes: true,
              letterPath: ArabicShapePaths.sadSmallShape,
              pointsJsonFile: ShapePointsManger.sadSmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.theh:
        return [
          TraceModel(
              poitionIndexPath: const Size(8, 30),
              poitionDottedPath: const Size(-2, 30),
              scaledottedPath: .9,
              scaleIndexPath: 1.1,
              distanceToCheck: 15,
              strokeWidth: 35,
              disableDivededStrokes: true,
              // indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.thehBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.thehBigIndex,
              strokeIndex: 1,
              letterPath: ArabicShapePaths.thehBigShape,
              pointsJsonFile: ShapePointsManger.thehBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              disableDivededStrokes: true,
              poitionIndexPath: const Size(40, 45),
              poitionDottedPath: const Size(5, 45),
              scaledottedPath: .7,
              scaleIndexPath: .72,
              distanceToCheck: 15,
              strokeWidth: 42,

              // indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.thehSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.thehSmallIndex,
              letterPath: ArabicShapePaths.thehSmall,
              pointsJsonFile: ShapePointsManger.thehSmallShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.kha2:
        return [
          TraceModel(
              poitionIndexPath: const Size(-5, 5),
              poitionDottedPath: const Size(-3, 20),
              scaledottedPath: .68,
              scaleIndexPath: .72,
              distanceToCheck: 40,
              strokeWidth: 40,
              // indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.khahBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.khahBigIndex,
              letterPath: ArabicShapePaths.khahBigShape,
              pointsJsonFile: ShapePointsManger.khahBigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(30, 20),
              poitionDottedPath: const Size(20, 35),
              scaledottedPath: .75,
              scaleIndexPath: .72,
              distanceToCheck: 40,
              strokeWidth: 40,
              // indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.khahSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              strokeIndex: 1.1,
              indexPath: ArabicShapePaths.khahSmallIndex,
              letterPath: ArabicShapePaths.khahSmallShape,
              pointsJsonFile: ShapePointsManger.khahSmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.alf:
        return [
          TraceModel(
              poitionIndexPath: const Size(12, -10),
              poitionDottedPath: const Size(16, -5),
              scaledottedPath: .9,
              scaleIndexPath: 1.05,
              strokeWidth: 30,
              distanceToCheck: 20,
              dottedPath: ArabicShapePaths.alefDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.alefIndex,
              letterPath: ArabicShapePaths.alefBig,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.alefBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.tah:
        return [
          TraceModel(
              disableDivededStrokes: true,
              poitionIndexPath: const Size(25, 25),
              poitionDottedPath: const Size(16, 15),
              scaledottedPath: .75,
              scaleIndexPath: .9,
              strokeWidth: 45,
              dottedPath: ArabicShapePaths.tahBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.tahBigIndex,
              letterPath: ArabicShapePaths.tahBig,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.tahBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.ein:
        return [
          TraceModel(
              poitionIndexPath: const Size(-25, -10),
              poitionDottedPath: const Size(-3, 0),
              scaledottedPath: .9,
              scaleIndexPath: 1.05,
              strokeWidth: 33,
              dottedPath: ArabicShapePaths.einBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.einBigIndex,
              letterPath: ArabicShapePaths.enBigShape,
              pointsJsonFile: ShapePointsManger.einbigShape,
              strokeIndex: 1,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(10, 0),
              poitionDottedPath: const Size(0, 0),
              scaledottedPath: .8,
              scaleIndexPath: .9,
              strokeWidth: 45,
              dottedPath: ArabicShapePaths.einSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.einSmallIndex,
              letterPath: ArabicShapePaths.enSmall,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.einsmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.mem:
        return [
          TraceModel(
              poitionIndexPath: const Size(10, 0),
              poitionDottedPath: const Size(0, -5),
              scaledottedPath: .85,
              strokeWidth: 35,
              scaleIndexPath: 1.1,
              dottedPath: ArabicShapePaths.memBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.memBigIndex,
              letterPath: ArabicShapePaths.memBig,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.membigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(5, 0),
              poitionDottedPath: const Size(5, 0),
              scaledottedPath: .8,
              scaleIndexPath: 1,
              dottedPath: ArabicShapePaths.memSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.memsmallIndex,
              letterPath: ArabicShapePaths.memSmall,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.memsmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case ArabicLetters.fa2:
        return [
          TraceModel(
              poitionIndexPath: const Size(50, 30),
              poitionDottedPath: const Size(-2, 27),
              scaledottedPath: .9,
              scaleIndexPath: .8,
              strokeWidth: 40,
              dottedPath: ArabicShapePaths.fa2BigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.fa2BigIndex,
              letterPath: ArabicShapePaths.fa2Big,
              pointsJsonFile: ShapePointsManger.fa2bigShape,
              strokeIndex: 1,
              disableDivededStrokes: true,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              poitionIndexPath: const Size(10, 30),
              poitionDottedPath: const Size(-2, 27),
              scaledottedPath: .6,
              scaleIndexPath: .85,
              strokeWidth: 50,
              dottedPath: ArabicShapePaths.fa2smallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.fa2SmallIndex,
              letterPath: ArabicShapePaths.fa2Small,
              strokeIndex: 1,
              pointsJsonFile: ShapePointsManger.fa2smallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.lam:
        return [
          TraceModel(
              strokeIndex: 1,
              dottedPath: ArabicShapePaths.lamBigDottted2,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.lamBigIndex2,
              poitionIndexPath: const Size(20, 10),
              poitionDottedPath: const Size(15, 20),
              // scaleIndexPath: ,
              scaledottedPath: .75,
              letterPath: ArabicShapePaths.lambig2,
              pointsJsonFile: ShapePointsManger.lamBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              strokeIndex: 1,
              dottedPath: ArabicShapePaths.lamSmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.lamSmallIndex,
              indexPathPaintStyle: PaintingStyle.stroke,
              letterPath: ArabicShapePaths.lamsmall,
              poitionIndexPath: const Size(20, 25),
              poitionDottedPath: const Size(5, 15),
              scaledottedPath: .7,
              pointsJsonFile: ShapePointsManger.lamsmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.ra2:
        return [
          TraceModel(
              strokeIndex: 1,
              dottedPath: ArabicShapePaths.ra2Dotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ra2Index,
              letterPath: ArabicShapePaths.ra2,
              poitionIndexPath: const Size(45, 10),
              poitionDottedPath: const Size(5, 5),
              scaleIndexPath: 1.1,
              scaledottedPath: .8,
              pointsJsonFile: ShapePointsManger.ra2Shape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.ba2:
        return [
          TraceModel(
              strokeIndex: 1,
              dottedPath: ArabicShapePaths.ba2BigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ba2BigIndex,
              letterPath: ArabicShapePaths.ba2BigShape,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.stroke,
              poitionIndexPath: const Size(5, -30),
              poitionDottedPath: const Size(5, -30),
              scaleIndexPath: 1,
              scaledottedPath: .75,
              pointsJsonFile: ShapePointsManger.ba2BigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              strokeIndex: 1,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.stroke,
              dottedPath: ArabicShapePaths.ba2SmallDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.ba2SmallIndex,
              letterPath: ArabicShapePaths.smallBa2Shape,
              poitionIndexPath: const Size(35, -34),
              poitionDottedPath: const Size(5, -30),
              scaleIndexPath: .85,
              scaledottedPath: .7,
              pointsJsonFile: ShapePointsManger.ba2SmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case ArabicLetters.sen:
        return [
          TraceModel(
              dottedPath: ArabicShapePaths.senBigDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.senBigIndex,
              letterPath: ArabicShapePaths.senBig,
              strokeIndex: 1,
              poitionIndexPath: const Size(5, 5),
              poitionDottedPath: const Size(0, 5),
              scaleIndexPath: 1.1,
              scaledottedPath: .92,
              pointsJsonFile: ShapePointsManger.senBigShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          TraceModel(
              dottedPath: ArabicShapePaths.senDotted3,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ArabicShapePaths.senIndex2,
              letterPath: ArabicShapePaths.sen2Small,
              poitionIndexPath: const Size(5, 0),
              strokeIndex: 1,
              poitionDottedPath: const Size(0, 5),
              scaleIndexPath: 1.1,
              scaledottedPath: .95,
              pointsJsonFile: ShapePointsManger.sensmallShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
    }
  }

  List<TraceModel> getTracingDataPhonics(
      {required String letter, Size sizeOfLetter = const Size(200, 200)}) {
    PhonicsLetters currentLetter =
        _detectTheCurrentEnumFromPhonics(letter: letter);

    switch (currentLetter) {
      case PhonicsLetters.n:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.nlowerShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.nlowerShapeIndex,
              strokeWidth: 70,
              disableDivededStrokes: true,
              scaleIndexPath: .3,
              poitionDottedPath: const Size(0, 0),
              poitionIndexPath: const Size(-50, -65),
              scaledottedPath: .75,
              letterPath: EnglishShapePaths2.nlowerShape,
              pointsJsonFile: ShapePointsManger.nLowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.e:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.eLowerShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.eLowerShapeIndex,
              strokeWidth: 70,
              disableDivededStrokes: true,
              scaleIndexPath: .12,
              poitionDottedPath: const Size(0, 0),
              poitionIndexPath: const Size(-20, -5),
              scaledottedPath: .75,
              letterPath: EnglishShapePaths2.eLowerShape,
              pointsJsonFile: ShapePointsManger.eLowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.w:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              dottedPath: EnglishShapePaths2.wBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.wBigShapeIndex,
              strokeWidth: 68,
              disableDivededStrokes: true,
              scaleIndexPath: .65,
              poitionDottedPath: const Size(0, 10),
              poitionIndexPath: const Size(-20, 5),
              scaledottedPath: .75,
              letterPath: EnglishShapePaths2.wBigShape,
              pointsJsonFile: ShapePointsManger.wUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.d:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.dLowerShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.dLowerShapeIndex,
              strokeWidth: 65,
              scaleIndexPath: .35,
              poitionDottedPath: const Size(0, 10),
              poitionIndexPath: const Size(30, -60),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.dLowerShape,
              pointsJsonFile: ShapePointsManger.dlowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case PhonicsLetters.o:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              dottedPath: EnglishShapePaths2.oShapeBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.oShapeBigShapeIndex,
              strokeWidth: 60,
              scaleIndexPath: .15,
              poitionDottedPath: const Size(5, 0),
              poitionIndexPath: const Size(-10, -70),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.oShapeBigShape,
              pointsJsonFile: ShapePointsManger.oUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.g:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.gLowrShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.gLowrShapeIndex,
              strokeWidth: 60,
              scaleIndexPath: .2,
              poitionIndexPath: const Size(40, -75),
              poitionDottedPath: const Size(0, 0),
              scaledottedPath: .8,
              letterPath: EnglishShapePaths2.gLowrShape,
              pointsJsonFile: ShapePointsManger.glowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.f:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.fLowerShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.fLowerShapeIndex,
              strokeWidth: 45,
              scaleIndexPath: .4,
              poitionIndexPath: const Size(10, -55),
              poitionDottedPath: const Size(10, 0),
              scaledottedPath: .8,
              letterPath: EnglishShapePaths2.fLowerShape,
              pointsJsonFile: ShapePointsManger.flowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.b:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.blowerShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.blowerShapeIndex,
              strokeWidth: 50,
              scaleIndexPath: .4,
              poitionIndexPath: const Size(-30, -55),
              poitionDottedPath: const Size(0, 10),
              scaledottedPath: .8,
              letterPath: EnglishShapePaths2.blowerShape,
              pointsJsonFile: ShapePointsManger.blowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.l:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.lLowerShapeDotted,
              strokeWidth: 90,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              indexPath: EnglishShapePaths2.lLowerShapeIndex,
              scaleIndexPath: .1,
              scaledottedPath: .93,
              poitionIndexPath: const Size(0, -55),
              poitionDottedPath: const Size(5, 0),
              letterPath: EnglishShapePaths2.lLowerShape,
              pointsJsonFile: ShapePointsManger.llowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2)
        ];

      case PhonicsLetters.u:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.uLowerShapeDotted,
              strokeWidth: 80,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.uLowerShapeIndex,
              scaleIndexPath: .7,
              scaledottedPath: .8,
              poitionIndexPath: const Size(0, -70),
              poitionDottedPath: const Size(0, 10),
              letterPath: EnglishShapePaths2.uLowerShape,
              pointsJsonFile: ShapePointsManger.ulowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case PhonicsLetters.j:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.jlowerShapeDotetd,
              strokeWidth: 50,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.jlowerShapeIndex,
              scaleIndexPath: .3,
              scaledottedPath: .65,
              poitionIndexPath: const Size(22, -65),
              poitionDottedPath: const Size(0, 25),
              letterPath: EnglishShapePaths2.jlowerShape,
              pointsJsonFile: ShapePointsManger.jlowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case PhonicsLetters.h:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.hLowerShapeDotted,
              strokeWidth: 50,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.hlowerShapeIndex,
              scaleIndexPath: .45,
              scaledottedPath: .85,
              poitionIndexPath: const Size(-40, -45),
              poitionDottedPath: const Size(0, 10),
              letterPath: EnglishShapePaths2.hLoweCaseShape,
              pointsJsonFile: ShapePointsManger.hlowerShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];

      case PhonicsLetters.s:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              dottedPath: ShapePaths.sDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ShapePaths.sIndex,
              strokeWidth: 75,
              scaleIndexPath: .65,
              poitionIndexPath: const Size(-10, 0),
              scaledottedPath: .8,
              letterPath: ShapePaths.s3,
              pointsJsonFile: ShapePointsManger.sShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2)
        ];
      case PhonicsLetters.a:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.aDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ShapePaths.aIndex,
              dottedPathPaintStyle: PaintingStyle.fill,
              indexPathPaintStyle: PaintingStyle.fill,
              scaleIndexPath: .3,
              poitionIndexPath: const Size(50, -60),
              scaledottedPath: .8,
              letterPath: ShapePaths.aShape,
              strokeWidth: 67,
              pointsJsonFile: ShapePointsManger.aShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2)
        ];
      case PhonicsLetters.m:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.mDotted,
              strokeWidth: 65,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ShapePaths.mIndex,
              indexPathPaintStyle: PaintingStyle.fill,
              scaleIndexPath: .6,
              scaledottedPath: .8,
              poitionIndexPath: const Size(-30, -50),
              letterPath: ShapePaths.mshape,
              pointsJsonFile: ShapePointsManger.mShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.k:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.kshapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              poitionIndexPath: const Size(-25, -30),
              poitionDottedPath: const Size(-10, 10),
              strokeWidth: 70,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.kshapeIndex,
              scaleIndexPath: .6,
              scaledottedPath: .8,
              letterPath: ShapePaths.kshape,
              pointsJsonFile: ShapePointsManger.KShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.q:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.qshapeDotted,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(40, -80),
              strokeWidth: 50,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.qshapeIndex,
              scaleIndexPath: .2,
              scaledottedPath: .8,
              letterPath: ShapePaths.qshape,
              pointsJsonFile: ShapePointsManger.qShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.v:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.vShapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(-30, -0),
              strokeWidth: 52,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.vShapeIndex,
              scaleIndexPath: .9,
              scaledottedPath: .8,
              letterPath: ShapePaths.vshape,
              pointsJsonFile: ShapePointsManger.vShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.x:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.xDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(-0, -75),
              strokeWidth: 57,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.xIndex,
              scaleIndexPath: .7,
              scaledottedPath: .8,
              disableDivededStrokes: true,
              letterPath: ShapePaths.xShape,
              pointsJsonFile: ShapePointsManger.xShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.y:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.yshapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(-0, -65),
              strokeWidth: 60,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.yShapeIndex,
              scaleIndexPath: .6,
              scaledottedPath: .75,
              letterPath: ShapePaths.yshape,
              pointsJsonFile: ShapePointsManger.yShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.z:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.zShapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(0, 0),
              strokeWidth: 75,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.zShapeIndex,
              scaleIndexPath: .7,
              scaledottedPath: .8,
              letterPath: ShapePaths.zShape,
              pointsJsonFile: ShapePointsManger.zShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.t:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.tshapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: ShapePaths.tshapeIndex,
              letterPath: ShapePaths.tShape,
              strokeWidth: 50,
              scaledottedPath: .8,
              scaleIndexPath: .33,
              poitionDottedPath: const Size(2, 10),
              poitionIndexPath: const Size(-30, -60),
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              pointsJsonFile: ShapePointsManger.tShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.c:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              dottedPath: ShapePaths.cshapeDoted,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.cshapeIndex,
              strokeWidth: 50,
              scaleIndexPath: .1,
              poitionIndexPath: const Size(140, -25),
              poitionDottedPath: const Size(5, 0),
              scaledottedPath: .9,
              letterPath: ShapePaths.cshaped,
              pointsJsonFile: ShapePointsManger.cShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.r:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.rShapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              strokeWidth: 70,
              dottedColor: AppColorPhonetics.greyColor,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.rshapeIndex,
              scaleIndexPath: .5,
              poitionIndexPath: const Size(-10, -50),
              scaledottedPath: .8,
              letterPath: ShapePaths.rshape,
              pointsJsonFile: ShapePointsManger.RShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.i:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.iShapeDotetd,
              dottedPathPaintStyle: PaintingStyle.fill,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionDottedPath: const Size(12, 20),
              poitionIndexPath: const Size(-15, -35),
              strokeWidth: 45,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.iShapeIndex,
              scaleIndexPath: .5,
              scaledottedPath: .5,
              letterPath: ShapePaths.iShape,
              pointsJsonFile: ShapePointsManger.iShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      case PhonicsLetters.p:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: ShapePaths.pShapeDotted,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionDottedPath: const Size(0, 5),
              poitionIndexPath: const Size(-46, -70),
              strokeWidth: 40,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: ShapePaths.pShapeIndex,
              scaleIndexPath: .2,
              scaledottedPath: .9,
              letterPath: ShapePaths.pShape,
              pointsJsonFile: ShapePointsManger.pShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
        ];
      default:
        return [];
    }
  }

  List<TraceModel> getTracingDataPhonicsUp(
      {required String letter, Size sizeOfLetter = const Size(200, 200)}) {
    PhonicsLetters currentLetter =
        _detectTheCurrentEnumFromPhonics(letter: letter);

    switch (currentLetter) {
      case PhonicsLetters.l:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.lBigShapeDotted,
              strokeWidth: 75,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              indexPath: EnglishShapePaths2.lBigShapeIndex,
              scaleIndexPath: .85,
              scaledottedPath: .8,
              poitionIndexPath: const Size(-45, 0),
              poitionDottedPath: const Size(0, 10),
              letterPath: EnglishShapePaths2.lBigShape,
              pointsJsonFile: ShapePointsManger.lUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.u:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.uBigShapeDotted,
              strokeWidth: 70,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.uBigShapeIndex,
              scaleIndexPath: .15,
              scaledottedPath: .93,
              poitionIndexPath: const Size(-50, -70),
              poitionDottedPath: const Size(5, 0),
              letterPath: EnglishShapePaths2.uBigShape,
              pointsJsonFile: ShapePointsManger.uUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.j:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.jBigShapeDotted,
              strokeWidth: 40,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.jBigShapeIndex,
              scaleIndexPath: .28,
              scaledottedPath: .93,
              poitionIndexPath: const Size(-22, -70),
              poitionDottedPath: const Size(0, 0),
              letterPath: EnglishShapePaths2.jBigShape,
              pointsJsonFile: ShapePointsManger.jUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.h:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.hBigShapeDotted,
              strokeWidth: 50,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.hBigShapeIndex,
              scaleIndexPath: .75,
              scaledottedPath: .8,
              poitionIndexPath: const Size(0, -45),
              poitionDottedPath: const Size(0, 10),
              letterPath: EnglishShapePaths2.hBigShape,
              pointsJsonFile: ShapePointsManger.hUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.o:
        // TODO ADD LOWER o LOWER CASE
        return [
          getTracingDataPhonics(letter: 'o', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'o', sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.g:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.gShapeBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.gShapeBigShapeIndex,
              strokeWidth: 60,
              scaleIndexPath: .4,
              poitionIndexPath: const Size(40, -30),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.gShapeBigShape,
              pointsJsonFile: ShapePointsManger.gUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.f:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.fShapeBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.fShapeBigShapeIndex,
              strokeWidth: 60,
              scaleIndexPath: .5,
              poitionIndexPath: const Size(-45, -40),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.fShapeBigShape,
              pointsJsonFile: ShapePointsManger.fUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.d:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.dBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.dBigShapeIndex,
              strokeWidth: 75,
              scaleIndexPath: .3,
              poitionIndexPath: const Size(-45, -80),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.dBigShape,
              pointsJsonFile: ShapePointsManger.dUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'd', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.w:
        return [
          getTracingDataPhonics(letter: 'w', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'w', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.e:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.eBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.eBigShapeIndex,
              strokeWidth: 75,
              scaleIndexPath: .8,
              poitionIndexPath: const Size(-20, 0),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.eBigShape,
              pointsJsonFile: ShapePointsManger.eUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'e', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.n:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.nBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.nBigShapeIndex,
              strokeWidth: 63,
              scaleIndexPath: .94,
              distanceToCheck: 25,
              disableDivededStrokes: true,
              poitionIndexPath: const Size(0, 0),
              scaledottedPath: .87,
              letterPath: EnglishShapePaths2.nBigShape,
              pointsJsonFile: ShapePointsManger.nUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'n', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.b:
        return [
          TraceModel(
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              dottedPath: EnglishShapePaths2.bShapeBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.bShapeBigShapeIndex,
              strokeWidth: 60,
              scaleIndexPath: .25,
              poitionIndexPath: const Size(-30, -80),
              scaledottedPath: .85,
              letterPath: EnglishShapePaths2.bShapeBigShape,
              pointsJsonFile: ShapePointsManger.bUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];

      case PhonicsLetters.s:
        // s phone
        return [
          getTracingDataPhonics(letter: 's', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 's', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.a:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.aShapeBigDotted,
              dottedColor: AppColorPhonetics.white,
              disableDivededStrokes: true,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.aShapeBigShapeIndex,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              scaleIndexPath: .67,
              poitionIndexPath: const Size(-15, -20),
              scaledottedPath: .8,
              letterPath: EnglishShapePaths2.aShapeBigShape,
              strokeWidth: 65,
              pointsJsonFile: ShapePointsManger.aUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'a', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.m:
        return [
          TraceModel(
              letterViewSize: sizeOfLetter,
              dottedPath: EnglishShapePaths2.mSHapeBigDoted,
              strokeWidth: 60,
              disableDivededStrokes: true,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPath: EnglishShapePaths2.mShapeBigIndex,
              scaleIndexPath: .9,
              scaledottedPath: .9,
              poitionIndexPath: const Size(0, 2),
              letterPath: EnglishShapePaths2.mShapeBigShape,
              pointsJsonFile: ShapePointsManger.mUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'm', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.k:
        return [
          getTracingDataPhonics(letter: 'k', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'k', sizeOfLetter: const Size(160, 160))
              .first
        ];
      case PhonicsLetters.q:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.qBigShapeDotted,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionIndexPath: const Size(10, 55),
              strokeWidth: 40,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: EnglishShapePaths2.qBigShapesIndex,
              scaleIndexPath: .3,
              scaledottedPath: .9,
              letterPath: EnglishShapePaths2.qBigShapes,
              pointsJsonFile: ShapePointsManger.qUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'q', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.v:
        return [
          getTracingDataPhonics(letter: 'v', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'v', sizeOfLetter: const Size(160, 160))
              .first
        ];
      case PhonicsLetters.x:
        return [
          getTracingDataPhonics(letter: 'x', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'x', sizeOfLetter: const Size(160, 160))
              .first
        ];
      case PhonicsLetters.y:
        return [
          getTracingDataPhonics(letter: 'y', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'y', sizeOfLetter: const Size(160, 160))
              .first
        ];
      case PhonicsLetters.z:
        return [
          getTracingDataPhonics(letter: 'z', sizeOfLetter: const Size(200, 200))
              .first,
          getTracingDataPhonics(letter: 'z', sizeOfLetter: const Size(160, 160))
              .first
        ];
      case PhonicsLetters.t:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.tShapeBigShapeDotted,
              dottedColor: AppColorPhonetics.white,
              indexColor: AppColorPhonetics.phonticGrey,
              indexPath: EnglishShapePaths2.tShapeBigShapeIndex,
              letterPath: EnglishShapePaths2.tShapeBigShape,
              strokeWidth: 50,
              scaledottedPath: .8,
              scaleIndexPath: .35,
              disableDivededStrokes: true,
              poitionDottedPath: const Size(5, -5),
              poitionIndexPath: const Size(-30, -70),
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              pointsJsonFile: ShapePointsManger.tUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 't', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.c:
        return [
          getTracingDataPhonics(letter: 'c').first,
          getTracingDataPhonics(letter: 'c', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.r:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.rShapeBigShapeDotted,
              indexPathPaintStyle: PaintingStyle.fill,
              dottedPathPaintStyle: PaintingStyle.fill,
              strokeWidth: 60,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: EnglishShapePaths2.rShapeBigShapeIndex,
              scaleIndexPath: .5,
              poitionIndexPath: const Size(-20, -40),
              scaledottedPath: .9,
              letterPath: EnglishShapePaths2.rShapeBigShape,
              pointsJsonFile: ShapePointsManger.rUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(letter: 'r', sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.i:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.iShapeBigShapeDotted,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionDottedPath: const Size(10, 0),
              poitionIndexPath: const Size(-22, 0),
              strokeWidth: 60,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: EnglishShapePaths2.iShapeBigShapeIndex,
              scaleIndexPath: .95,
              scaledottedPath: .9,
              letterPath: EnglishShapePaths2.iShapeBigShape,
              pointsJsonFile: ShapePointsManger.iUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];
      case PhonicsLetters.p:
        return [
          TraceModel(
              dottedPath: EnglishShapePaths2.pBigShapeDotted,
              dottedPathPaintStyle: PaintingStyle.stroke,
              indexPathPaintStyle: PaintingStyle.fill,
              poitionDottedPath: const Size(-5, 5),
              poitionIndexPath: const Size(-40, -80),
              strokeWidth: 40,
              dottedColor: AppColorPhonetics.phonticGrey,
              indexColor: AppColorPhonetics.white,
              indexPath: EnglishShapePaths2.pBigShapeIndex,
              scaleIndexPath: .25,
              scaledottedPath: .92,
              letterPath: EnglishShapePaths2.pBigShape,
              pointsJsonFile: ShapePointsManger.pUpperShape,
              innerPaintColor: AppColorPhonetics.lightBlueColor4,
              outerPaintColor: AppColorPhonetics.lightBlueColor2),
          getTracingDataPhonics(
                  letter: letter, sizeOfLetter: const Size(160, 160))
              .first,
        ];
      default:
        return [];
    }
  }
}
