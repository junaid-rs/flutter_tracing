import 'package:flutter/material.dart';
import 'package:tracing/tracing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Tracing Game'),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: TracingCharsGame(
                    traceShapeModel: [
                      TraceShapeModel(shapes: ['S', 'a', 'Q']),
                    ],
                    tracingListener: (buildContext, tracingState) async {
                      if (tracingState.drawingStates ==
                          DrawingStates.finishedCurrentScreen) {
                        await Future.delayed(Duration(seconds: 1));
                      } else if (tracingState.drawingStates ==
                          DrawingStates.gameFinished) {
                        print('finished the game');
                      }
                    },
                  ),
                ),
                TracingWordGame(
                  words: ['Flutter'],
                  tracingListener: (buildContext, tracingState) async {
                    if (tracingState.drawingStates ==
                        DrawingStates.finishedCurrentScreen) {
                      await Future.delayed(Duration(seconds: 1));
                    } else if (tracingState.drawingStates ==
                        DrawingStates.gameFinished) {
                      print('finished the game');
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
