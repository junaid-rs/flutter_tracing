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
        body: Column(
          children: [
            Expanded(
              child: TracingCharsGame(
                showAnchor: true,
                traceShapeModel: [
                  TraceCharsModel(chars: [
                    TraceCharModel(
                        char: 'ج',
                        traceShapeOptions: const TraceShapeOptions(
                            innerPaintColor: Colors.orange)),
                    TraceCharModel(
                        char: 'f',
                        traceShapeOptions: const TraceShapeOptions(
                            innerPaintColor: Colors.orange))
                  ]),
                  TraceCharsModel(chars: [
                    TraceCharModel(
                        char: 'a',
                        traceShapeOptions: const TraceShapeOptions(
                            innerPaintColor: Colors.orange)),
                    TraceCharModel(
                        char: 'A',
                        traceShapeOptions: const TraceShapeOptions(
                            innerPaintColor: Colors.orange))
                  ]),
                ],

                onTracingUpdated: (int currentTracingIndex) async {
                  print('/////onTracingUpdated:' +
                      currentTracingIndex.toString());
                },
                onGameFinished: (int screenIndex) async {
                  print('/////onGameFinished:' + screenIndex.toString());
                },
                onCurrentTracingScreenFinished: (int currentScreenIndex) async {
                  print('/////onCurrentTracingScreenFinished:' +
                      currentScreenIndex.toString());
                },
              ),
            ),
            TracingGeometricShapesGame(
              traceGeoMetricShapeModels: [
                TraceGeoMetricShapeModel(shapes: [
                  MathShapeWithOption(
                      shape: MathShapes.circle,
                      traceShapeOptions: const TraceShapeOptions(
                          innerPaintColor: Colors.orange)),
                  MathShapeWithOption(
                      shape: MathShapes.triangle1,
                      traceShapeOptions: const TraceShapeOptions(
                          innerPaintColor: Colors.orange))
                ]),
                TraceGeoMetricShapeModel(shapes: [
                  MathShapeWithOption(
                      shape: MathShapes.rectangle,
                      traceShapeOptions: const TraceShapeOptions(
                          innerPaintColor: Colors.orange)),
                  MathShapeWithOption(
                      shape: MathShapes.triangle2,
                      traceShapeOptions: const TraceShapeOptions(
                          innerPaintColor: Colors.orange))
                ]),
              ],
            ),
            Expanded(
              child: TracingWordGame(
                words: [
                  TraceWordModel(word: 'I Have',traceShapeOptions: const TraceShapeOptions(
                    indexColor: Colors.green
                  ))
                ],
                      onTracingUpdated: (int currentTracingIndex) async {
                  print('/////onTracingUpdated:' +
                      currentTracingIndex.toString());
                },
                onGameFinished: (int screenIndex) async {
                  print('/////onGameFinished:' + screenIndex.toString());
                },
                onCurrentTracingScreenFinished: (int currentScreenIndex) async {
                  print('/////onCurrentTracingScreenFinished:' +
                      currentScreenIndex.toString());
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
