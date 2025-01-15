import 'package:tracing/src/tracing/model/trace_shape_options.dart';
import 'package:tracing/tracing.dart';

class TraceCharsModel{
  final List<TraceCharModel> chars;

  TraceCharsModel({required this.chars,});
}

class TraceCharModel {
final  String char;
 final TraceShapeOptions traceShapeOptions;
  TraceCharModel({
   required this.char,
    this.traceShapeOptions= const TraceShapeOptions(),
  });
}
