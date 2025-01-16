
# Tracing Game Flutter Package

A Flutter game that lets users trace words , characters and geometric shapes to help users practice tracing.



## Installation

To use the `tracing` package in your Flutter project, follow these steps:

1. Open your `pubspec.yaml` file.
2. Add the `tracing` package to your dependencies section:

```yaml
dependencies:
  flutter:
    sdk: flutter
  tracing: ^0.0.1
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







## Example:




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





## Customization

You can customize the tracing games by providing different shapes, colors, and configurations. Here are some options:

| Name                         | Type                | Description                                                                 |
| - | - |  |
| `traceShapeModel`             | List                | A list of traceable shapes or characters                                    |
| `showAnchor`                  | bool                | Show anchor points for better tracing guidance                              |
| `tracingListener`             | Function           | A listener that receives tracing state updates (game progress and completion)|
| `traceShapeOptions`           | TraceShapeOptions   | Options for customizing the appearance of the traced shapes or characters    |


Sure! Here's the updated documentation incorporating the code snippet you've provided:



### Customizing the Tracing Games

You can customize the tracing games by providing different shapes, colors, and configurations. Here are some options:

| Name                         | Type                | Description                                                                 |
| - | - |  |
| `traceShapeModel`             | List                | A list of traceable shapes or characters                                    |
| `showAnchor`                  | bool                | Show anchor points for better tracing guidance                              |
| `tracingListener`             | Function           | A listener that receives tracing state updates (game progress and completion)|
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



### `TraceShapeOptions` Class Properties:

| Name             | Type               | Description                                                         |
| - |  | - |
| `outerPaintColor`| Color              | Color of the outer stroke when tracing a shape or character.        |
| `innerPaintColor`| Color              | Color of the inner stroke or fill when tracing a shape or character.|
| `dottedColor`    | Color              | Color of the dotted lines for trace instructions.                   |
| `indexColor`     | Color              | Color for the index or guide points while tracing the shape.        |

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



## Contributions

We welcome contributions to the package! Whether you want to add new shapes, features, or fixes, feel free to fork the repository, make improvements, and create a pull request.

### Getting Involved

We are grateful for any contributions! Here's how you can get involved:

- **Reporting Issues**: Use the GitHub issue tracker to report bugs or suggest improvements.
- **Discussions**: Share your ideas or ask questions via GitHub Discussions or StackOverflow.





## About

This project is maintained by the developers listed below.

### Author:
- [GitHub] (https://github.com/ZeyadShawki)
- [LinkedIn](https://www.linkedin.com/in/zeyad-shawki-907331277/)

Thank you for your interest in the Tracing Game package. Happy coding!