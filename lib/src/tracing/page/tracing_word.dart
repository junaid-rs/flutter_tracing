import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracing/src/tracing/phonetics_paint_widget/phonetics_painter.dart';

import '../manager/tracing_cubit.dart';

class TracingWordGame extends StatefulWidget {
  const TracingWordGame({super.key});

  @override
  State<StatefulWidget> createState() => _TracingWordGameState();
}

class _TracingWordGameState extends State<TracingWordGame> {
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
        if (stateOfGame.drawingStates == DrawingStates.finishedCurrentPart) {

        }
      },
      builder: (context, state) {
        if (state.drawingStates == DrawingStates.loading ||
            state.drawingStates == DrawingStates.initial) {
          return Container();
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 1.1,
          child: FittedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // margin: REdgeInsets.only(
                    //     right: state.isArabic ? 80 : 0,
                    //     left: state.isArabic ? 80 : 0),
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
                            children: List.generate(
                              state.letterPathsModels.length,
                              (index) {
                                log(state.letterPathsModels[index].viewSize
                                    .toString());
                                return Container(
                                  height: state
                                      .letterPathsModels[index].viewSize.width,
                                  width: state
                                      .letterPathsModels[index].viewSize.height,
                                  margin: state.letterPathsModels[index].isSpace
                                      ? EdgeInsets.only(right: 150)
                                      : EdgeInsets.zero,

                                  // padding: REdgeInsets.only(
                                  //   bottom:context.isTablet()? 0:100.h
                                  // ),
                                  // color: Colors.green,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: GestureDetector(
                                      onPanStart: (details) {
                                        log('debged start');
                                        debugPrint(index.toString());
                                        debugPrint(
                                            state.activeIndex.toString());
                                        if (index == state.activeIndex &&
                                            (state.index > 0 
                                               )) {
                                          print('sssss');
                                          tracingCubit.handlePanStart(
                                              details.localPosition);
                                        }
                                      },
                                      onPanUpdate: (details) {
                                        log('debged updated');

                                        if (index == state.activeIndex &&
                                            (state.index > 0 )) {
                                          print('222');

                                          tracingCubit.handlePanUpdate(
                                              details.localPosition);
                                        }
                                      },
                                      onPanEnd: (details) {},
                                      child: Stack(
                                        // fit: StackFit.loose,
                                        clipBehavior: Clip.none,
                                        // alignment: Alignment.b,
                                        children: [
                                          CustomPaint(
                                            // isComplex: true,
                                            size: tracingCubit.viewSize,

                                            painter: PhoneticsPainter(
                                              strokeIndex: state
                                                  .letterPathsModels[index]
                                                  .strokeIndex,
                                              indexPath: state
                                                  .letterPathsModels[index]
                                                  .letterIndex,
                                              dottedPath: state
                                                  .letterPathsModels[index]
                                                  .dottedIndex,
                                              letterColor: state
                                                  .letterPathsModels[index]
                                                  .outerPaintColor,
                                              letterImage: state
                                                  .letterPathsModels[index]
                                                  .letterImage!,
                                              paths: state
                                                  .letterPathsModels[index]
                                                  .paths,
                                              currentDrawingPath: state
                                                  .letterPathsModels[index]
                                                  .currentDrawingPath,
                                              pathPoints: state
                                                  .letterPathsModels[index]
                                                  .allStrokePoints
                                                  .expand((p) => p)
                                                  .toList(),
                                              strokeColor: state
                                                  .letterPathsModels[index]
                                                  .innerPaintColor,
                                              viewSize: state
                                                  .letterPathsModels[index]
                                                  .viewSize,
                                              strokePoints: state
                                                      .letterPathsModels[index]
                                                      .allStrokePoints[
                                                  state.letterPathsModels[index]
                                                      .currentStroke],
                                              strokeWidth: state
                                                  .letterPathsModels[index]
                                                  .strokeWidth,
                                              dottedColor: state
                                                  .letterPathsModels[index]
                                                  .dottedColor,
                                              indexColor: state
                                                  .letterPathsModels[index]
                                                  .indexColor,
                                              indexPathPaintStyle: state
                                                  .letterPathsModels[index]
                                                  .indexPathPaintStyle,
                                              dottedPathPaintStyle: state
                                                  .letterPathsModels[index]
                                                  .dottedPathPaintStyle,
                                            ),
                                          ),
                                          if (state.activeIndex == index)
                                            Positioned(
                                              top: state
                                                  .letterPathsModels[
                                                      state.activeIndex]
                                                  .anchorPos!
                                                  .dy,
                                              left: state
                                                  .letterPathsModels[
                                                      state.activeIndex]
                                                  .anchorPos!
                                                  .dx,
                                              child: Image.asset(
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
