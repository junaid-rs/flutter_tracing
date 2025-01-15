import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracing/src/tracing/phonetics_paint_widget/phonetics_painter.dart';
import 'package:tracing/tracing.dart';

import '../manager/tracing_cubit.dart';

class TraceShapesGame extends StatefulWidget {
  const TraceShapesGame({super.key});

  @override
  State<StatefulWidget> createState() => _TraceShapesGameState();
}

class _TraceShapesGameState extends State<TraceShapesGame> {
  late TracingCubit tracingCubit;

  @override
  void initState() {
    super.initState();
    tracingCubit = context.read<TracingCubit>();

   
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TracingCubit, TracingState>(
      listener: (context, stateOfGame) async {
    
      },
      builder: (context, state) {
        if (state.drawingStates == DrawingStates.loading ||
            state.drawingStates == DrawingStates.initial) {
          return Container();
        }

        if (state.letterPathsModels.isEmpty) {
          return SizedBox();
        }
        double contWidth = 0;
        double contHeight = 0;
        for (var e in state.letterPathsModels) {
          if (e.viewSize.height > contHeight) {
            contHeight = e.viewSize.height;
          }
          contWidth = e.viewSize.width + contWidth;
        }
        log(contWidth.toString());
        final s = MediaQuery.sizeOf(context).width;
        return Container(
          // color: Colors.orange,
          height: MediaQuery.of(context).size.height/1.5,
              decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppColorPhonetics.darkBorderColor, width: 2)),
          width: MediaQuery.of(context).size.width / 1.1,
          child: FittedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                              height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width / 1.1,

                    // margin: REdgeInsets.only(
                    //     right: state.isArabic ? 80 : 0,
                    //     left: state.isArabic ? 80 : 0),
                    // margin: EdgeInsets.only(bottom: 30),
                    child: FittedBox(
                      child: Container(
                        // margin: REdgeInsets.only(left: 0),
                        // color: Colors.amber,
                        // color: Colors.red,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.s,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  List.generate(
  state.letterPathsModels.length,
  (index) {
    log(state.letterPathsModels[index].viewSize.toString());

    // Determine the alternating offset based on index
    final offset = index % 2 == 0 ? 30 : 0; // Adjust the value as needed

    return Container(
      padding: EdgeInsets.fromLTRB(15,0,15,offset.toDouble()),
      height: state.letterPathsModels[index].viewSize.width,
      width: state.letterPathsModels[index].viewSize.height,
      child: FittedBox(
        fit: BoxFit.contain,
        child: GestureDetector(
          onPanStart: (details) {
            if (index == state.activeIndex &&
                state.index > 0) {
              tracingCubit.handlePanStart(details.localPosition);
            }
          },
          onPanUpdate: (details) {

            if (index == state.activeIndex &&
                state.index > 0 ) {

              tracingCubit.handlePanUpdate(details.localPosition);
            }
          },
          onPanEnd: (details) {},
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomPaint(
                size: tracingCubit.viewSize,
                painter: PhoneticsPainter(
                  strokeIndex: state.letterPathsModels[index].strokeIndex,
                  indexPath: state.letterPathsModels[index].letterIndex,
                  dottedPath: state.letterPathsModels[index].dottedIndex,
                  letterColor: state.letterPathsModels[index].outerPaintColor,
                  letterImage: state.letterPathsModels[index].letterImage!,
                  paths: state.letterPathsModels[index].paths,
                  currentDrawingPath:
                      state.letterPathsModels[index].currentDrawingPath,
                  pathPoints: state.letterPathsModels[index].allStrokePoints
                      .expand((p) => p)
                      .toList(),
                  strokeColor: state.letterPathsModels[index].innerPaintColor,
                  viewSize: state.letterPathsModels[index].viewSize,
                  strokePoints: state.letterPathsModels[index]
                      .allStrokePoints[state.letterPathsModels[index].currentStroke],
                  strokeWidth: state.letterPathsModels[index].strokeWidth,
                  dottedColor: state.letterPathsModels[index].dottedColor,
                  indexColor: state.letterPathsModels[index].indexColor,
                  indexPathPaintStyle:
                      state.letterPathsModels[index].indexPathPaintStyle,
                  dottedPathPaintStyle:
                      state.letterPathsModels[index].dottedPathPaintStyle,
                ),
              ),
              if (state.activeIndex == index)
                Positioned(
                  top: state.letterPathsModels[state.activeIndex].anchorPos!.dy,
                  left: state.letterPathsModels[state.activeIndex].anchorPos!.dx,
                  child: 
                  
                  Image.asset(
                    'packages/tracing/assets/images/position_2_finger',
                    height: 50,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  },
),

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
