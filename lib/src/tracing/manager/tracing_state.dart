part of 'tracing_cubit.dart';

enum DrawingStates {
  error,
  initial,
  loading,
  loaded,
  gameFinished,
  finishedCurrentPart
}

// ignore: must_be_immutable
class TracingState extends Equatable {
  final List<TraceShapeModel> traceShapeModel;

  final List<TraceModel> traceLetter;
  final DrawingStates drawingStates;
  List<LetterPathsModel> letterPathsModels;
  final int activeIndex; // Track the active letter index
  final int index;
  final Size viewSize;
  final StateOfTracing trace;

  TracingState({
    required this.traceShapeModel,
    this.viewSize = const Size(0, 0),
    this.letterPathsModels = const [],
    required this.traceLetter,
    required this.trace,
    this.drawingStates = DrawingStates.initial,
    required this.index,
    this.activeIndex = 0,
  });

  TracingState copyWith({
    List<TraceShapeModel>? traceShapeModel,
    Size? viewSize,
    DrawingStates? drawingStates,
    int? index,
    // Updated to ui.Image
    List<LetterPathsModel>? letterPathsModels,
    List<TraceModel>? traceLetter,
    StateOfTracing? trace,
    int? activeIndex,
  }) {
    return TracingState(
      traceShapeModel: traceShapeModel ?? this.traceShapeModel,
      index: index ?? this.index,
      trace: trace ?? this.trace,
      letterPathsModels: letterPathsModels ?? this.letterPathsModels,
      traceLetter: traceLetter ?? this.traceLetter,
      activeIndex: activeIndex ?? this.activeIndex,
      drawingStates: drawingStates ?? this.drawingStates,
    );
  }

  TracingState clearData() {
    return TracingState(
      traceShapeModel: traceShapeModel,
      letterPathsModels: letterPathsModels,
      drawingStates: DrawingStates.initial,
      trace: trace,
      index: index,
      traceLetter: traceLetter,
    );
  }

  @override
  List<Object?> get props => [traceShapeModel,
        drawingStates,
        viewSize,
        trace,
        index,
        traceLetter,
        letterPathsModels.map((model) => model.copyWith()).toList(),
        activeIndex
      ];
}
