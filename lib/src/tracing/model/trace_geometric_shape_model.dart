
import 'package:tracing/src/tracing/model/trace_shape_options.dart';
import 'package:tracing/tracing.dart';

class TraceGeoMetricShapeModel{
  final List<MathShapeWithOption> shapes;

  TraceGeoMetricShapeModel({required this.shapes,});
}

class MathShapeWithOption {
final  MathShapes shape;
 final TraceShapeOptions traceShapeOptions;
  MathShapeWithOption({
   required this.shape,
    this.traceShapeOptions= const TraceShapeOptions(),
  });
}
