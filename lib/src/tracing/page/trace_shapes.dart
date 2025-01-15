import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracing/src/tracing/phonetics_paint_widget/phonetics_painter.dart';
import 'package:tracing/tracing.dart';

class TracingGeometricShapesGame extends StatefulWidget {
  const TracingGeometricShapesGame({
    super.key,
    required this.traceGeoMetricShapeModels,
    required this.tracingListener,
    this.loadingIndictor = const CircularProgressIndicator(),
  });
  final List<TraceGeoMetricShapeModel> traceGeoMetricShapeModels;
  final Future<void> Function(BuildContext, TracingState) tracingListener;
  final Widget loadingIndictor;
  @override
  State<StatefulWidget> createState() => _TracingGeometricShapesGameState();
}

class _TracingGeometricShapesGameState
    extends State<TracingGeometricShapesGame> {
  late TracingCubit tracingCubit;

  @override
  void initState() {
    super.initState();
    tracingCubit = TracingCubit(
      stateOfTracing: StateOfTracing.traceShapes,
      traceGeoMetricShapeModel: widget.traceGeoMetricShapeModels,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Adjust bottom padding based on platform and navigation bar presence
    return BlocProvider(
        create: (context) => tracingCubit,
        child: BlocConsumer<TracingCubit, TracingState>(
          listener: (context, stateOfGame) async {
            await widget.tracingListener(context, stateOfGame);
            if (stateOfGame.drawingStates ==
                DrawingStates.finishedCurrentScreen) {
              if (context.mounted) {
                context.read<TracingCubit>().updateIndex();
              }
            }
          },
          builder: (context, state) {
            if (state.drawingStates == DrawingStates.loading ||
                state.drawingStates == DrawingStates.initial) {
              return widget.loadingIndictor;
            }

            if (state.letterPathsModels.isEmpty) {
              return SizedBox();
            }

            return FittedBox(
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
                        log(state.letterPathsModels[index].viewSize.toString());

                        // Determine the alternating offset based on index
                        final offset = index % 2 == 0
                            ? 30
                            : 0; // Adjust the value as needed

                        return Container(
                          padding:
                              EdgeInsets.fromLTRB(15, 0, 15, offset.toDouble()),
                          height: state.letterPathsModels[index].viewSize.width,
                          width: state.letterPathsModels[index].viewSize.height,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: GestureDetector(
                              onPanStart: (details) {
                                if (index == state.activeIndex) {
                                  tracingCubit
                                      .handlePanStart(details.localPosition);
                                }
                              },
                              onPanUpdate: (details) {
                                if (index == state.activeIndex) {
                                  tracingCubit
                                      .handlePanUpdate(details.localPosition);
                                }
                              },
                              onPanEnd: (details) {},
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CustomPaint(
                                    size: tracingCubit.viewSize,
                                    painter: PhoneticsPainter(
                                      strokeIndex: state
                                          .letterPathsModels[index].strokeIndex,
                                      indexPath: state
                                          .letterPathsModels[index].letterIndex,
                                      dottedPath: state
                                          .letterPathsModels[index].dottedIndex,
                                      letterColor: state
                                          .letterPathsModels[index]
                                          .outerPaintColor,
                                      letterImage: state
                                          .letterPathsModels[index]
                                          .letterImage!,
                                      paths:
                                          state.letterPathsModels[index].paths,
                                      currentDrawingPath: state
                                          .letterPathsModels[index]
                                          .currentDrawingPath,
                                      pathPoints: state.letterPathsModels[index]
                                          .allStrokePoints
                                          .expand((p) => p)
                                          .toList(),
                                      strokeColor: state
                                          .letterPathsModels[index]
                                          .innerPaintColor,
                                      viewSize: state
                                          .letterPathsModels[index].viewSize,
                                      strokePoints: state
                                              .letterPathsModels[index]
                                              .allStrokePoints[
                                          state.letterPathsModels[index]
                                              .currentStroke],
                                      strokeWidth: state
                                          .letterPathsModels[index].strokeWidth,
                                      dottedColor: state
                                          .letterPathsModels[index].dottedColor,
                                      indexColor: state
                                          .letterPathsModels[index].indexColor,
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
                                          .letterPathsModels[state.activeIndex]
                                          .anchorPos!
                                          .dy,
                                      left: state
                                          .letterPathsModels[state.activeIndex]
                                          .anchorPos!
                                          .dx,
                                      child: Image.asset(
                                        'packages/tracing/assets/images/position_2_finger.png',
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
            );
          },
        ));
  }
}
