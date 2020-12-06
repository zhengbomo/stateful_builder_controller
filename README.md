## stateful_builder_controller

[![pub package](https://img.shields.io/pub/v/stateful_builder_controller.svg)](https://pub.dartlang.org/packages/stateful_builder_controller)


control setState for StatefulWidget locally

## Example

```dart
// 0. define property for widget
double headerHeight = 100;

// 1. create SetterController
final setterController = SetterController();

// 2. create StatefulWidget with headerHeight and setterController
@override
Widget build(BuildContext context) {
  return StatefulBuilder1<Widget>(
    controller: setterController,
    builder: (context, setter, value) {
      return Container(
        height: headerHeight,
        color: Colors.red,
        alignment: Alignment.center,
        child: value,
      );
    },
    value: Text("big widget"),
  );
}

// 3. update headerHeight with setterController for reload StatefulBuilder1 only
setterController.update(() {
  headerHeight = 200;
});
```
