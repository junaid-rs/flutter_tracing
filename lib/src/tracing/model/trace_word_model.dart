
import 'package:tracing/src/tracing/model/trace_shape_options.dart';
import 'package:tracing/tracing.dart';


class TraceWordModel {
final  String word;
 final TraceShapeOptions traceShapeOptions;
  TraceWordModel({
   required this.word,
    this.traceShapeOptions= const TraceShapeOptions(),
  });
}
