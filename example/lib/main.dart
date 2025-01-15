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
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Native Packages'),
          ),
          body: Container(
            height: 400,
            width: 100,
            child: TracingGame(
              traceShapeModel: [
                TraceShapeModel(
                    shape: '1234', stateOfTracing: StateOfTracing.math)
              ],
            ),
          )),
    );
  }
}
