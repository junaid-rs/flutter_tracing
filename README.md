
# Tracing Game Flutter Package

A Flutter game that lets users trace words , characters and geometric shapes to help users practice tracing.



## Installation

To use the `tracing_game` package in your Flutter project, follow these steps:

1. Open your `pubspec.yaml` file.
2. Add the `tracing_game` package to your dependencies section:

```yaml
dependencies:
  flutter:
    sdk: flutter
  tracing_game: ^0.0.2
```

3. Run the following command in your terminal to install the package:

```bash
flutter pub get
```




## Features

Tracing of English characters (both lower and upper case) and all Arabic characters.
Tracing of English numbers from 1 to 10.
Tracing of English words and numbers.
Tracing of geometric shapes like rectangles, circles, and triangles.
Interactive game-like experience with feedback.
Supports custom colors and tracing options for customization.
Supports multiple screens

![ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/a77a55d0-b8f9-4483-8473-acb059866d54)

![Screenshot_1737029029](https://github.com/user-attachments/assets/c91963c8-5b73-4a99-a40d-01a3ef6aac31)

![Screenshot_1737052171](https://github.com/user-attachments/assets/ca52957a-5d35-40e5-b163-9bb9ceaf4215)

![Screenshot_1737029980](https://github.com/user-attachments/assets/7790ef04-043a-4010-bd56-c9cc977786bb)

![Screenshot_1737029847](https://github.com/user-attachments/assets/9ee025dc-acd3-4f67-baf1-33ce77b4fcd2)

![Screenshot_1737029119](https://github.com/user-attachments/assets/9f6567e3-794d-431e-a794-b65290a52cc4)

![Screenshot_1737029513](https://github.com/user-attachments/assets/368b1934-9da5-44de-a60c-83c137bc9817)

## Example




### **Tracing Words**

In the `TracingWordsGame`, you can trace entire English words and numbers, including spaces between words. The `TracingWordGame` accepts a list of `TraceWordModel` objects, where each `TraceWordModel` contains a word (string) and `TraceShapeOptions` for customizing the appearance of the traced shapes.

 ### **Example:**

```dart
TracingWordGame(
  words: [
    TraceWordModel(
      word: 'I Have',
      traceShapeOptions: const TraceShapeOptions(
        indexColor: Colors.green,
      ),
    ),
  ],
),
```


### Tracing character

The `TracingCharsGame` accepts a list of `TraceCharsModel` objects that will be displayed on the screen. Each `TraceCharsModel` contains a list of `TraceCharModel` objects. The `TraceCharModel` accepts a character (char) and `TraceShapeOptions` for customizing the color and appearance of the traced shape.

### **Example:**

```dart
TracingCharsGame(
  showAnchor: true,
  traceShapeModel: [
    TraceCharsModel(chars: [
      TraceCharModel(
        char: 'F',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
      TraceCharModel(
        char: 'f',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
    ]),
    TraceCharsModel(chars: [
      TraceCharModel(
        char: 'a',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
      TraceCharModel(
        char: 'A',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
    ]),
    TraceCharsModel(chars: [
      TraceCharModel(
        char: '1',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
      TraceCharModel(
        char: '4',
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
    ]),
  ],
),
```



### Tracing Geometric Shapes

In this example, the tracing of geometric shapes like rectangles, circles, and triangles (4 types) is supported.

The `TracingGeometricShapesGame` accepts a list of `TraceGeoMetricShapeModel` objects, which will be displayed on the screen. Each `TraceGeoMetricShapeModel` contains a list of `MathShapeWithOption` objects. The `MathShapeWithOption` accepts a `MathShapes` enum to define the type of shape (e.g., circle, rectangle, triangle) and `TraceShapeOptions` to customize the color and appearance of the traced shape.

### **Example:**

```dart
TracingGeometricShapesGame(
  traceGeoMetricShapeModels: [
    TraceGeoMetricShapeModel(shapes: [
      MathShapeWithOption(
        shape: MathShapes.circle,
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
      MathShapeWithOption(
        shape: MathShapes.triangle1,
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
    ]),
    TraceGeoMetricShapeModel(shapes: [
      MathShapeWithOption(
        shape: MathShapes.rectangle,
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
      MathShapeWithOption(
        shape: MathShapes.triangle2,
        traceShapeOptions: const TraceShapeOptions(
          innerPaintColor: Colors.orange
        ),
      ),
    ]),
  ],
),
```






## Customizing the Tracing Games

You can customize the tracing games by providing different shapes, colors, and configurations. Here are some options:

| Name                         | Type                | Description                                                                 |
|------------------------------|---------------------|-----------------------------------------------------------------------------|
| `traceShapeModel`             | List                | A list of traceable shapes or characters                                    |
| `showAnchor`                  | bool                | Show anchor finger for better tracing guidance                              |
| `traceShapeOptions`           | TraceShapeOptions   | Options for customizing the appearance of the traced shapes or characters    |

### Available Callbacks

You can also attach various callback functions to track the progress and state of the tracing game:

- **`onTracingUpdated`**: This callback is triggered when the tracing progress is updated. It provides the current tracing index, which you can use to track the player's progress.

    ```dart
    onTracingUpdated: (int currentTracingIndex) async {
        print('/////onTracingUpdated:' + currentTracingIndex.toString());
    }
    ```

- **`onGameFinished`**: This callback is triggered when the game is finished. It provides the screen index of the last screen.

    ```dart
    onGameFinished: (int screenIndex) async {
        print('/////onGameFinished:' + screenIndex.toString());
    }
    ```

- **`onCurrentTracingScreenFinished`**: This callback is triggered when the current tracing screen is completed. It provides the index of the current tracing screen.

    ```dart
    onCurrentTracingScreenFinished: (int currentScreenIndex) async {
        print('/////onCurrentTracingScreenFinished:' + currentScreenIndex.toString());
    }
    ```

By utilizing these options and callbacks, you can fully customize the behavior and appearance of the tracing game to suit your needs.

---

### `TraceShapeOptions` Class Properties:

| Name             | Type               | Description                                                         |
|------------------|--------------------|---------------------------------------------------------------------|
| `outerPaintColor`| Color              | Color of the outer stroke when tracing a shape or character.        |
| `innerPaintColor`| Color              | Color of the inner stroke or fill when tracing a shape or character.|
| `dottedColor`    | Color              | Color of the dotted lines for trace instructions.                   |
| `indexColor`     | Color              | Color for the index or guide path while tracing the shape.        |

```dart
class TraceShapeOptions {
  final Color outerPaintColor;
  final Color innerPaintColor;
  final Color dottedColor;
  final Color indexColor;

  const TraceShapeOptions({
    this.dottedColor = AppColorPhonetics.grey,
    this.indexColor = Colors.black,
    this.innerPaintColor = AppColorPhonetics.lightBlueColor6,
    this.outerPaintColor = AppColorPhonetics.lightBlueColor5,
  });
}
```


### `MathShapes` Enum:

The `MathShapes` enum provides a set of predefined shapes that can be used in the tracing game. These shapes can be utilized as part of the `traceShapeModel` or other relevant configurations.

```dart
enum MathShapes {
  circle,
  triangle1,
  triangle2,
  triangle3,
  triangle4,
  rectangle,
}
```




### Author:
- [GitHub](https://github.com/ZeyadShawki)
- [LinkedIn](https://www.linkedin.com/in/zeyad-shawki-907331277/)

Happy coding!
