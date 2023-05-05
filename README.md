`stream_value` is a simple state management package for Flutter that allows you to easily manage the state of your app without the need for boilerplate code. Unlike many other state management solutions, `stream_value` is not a dependency injection package.

It's important to note that there are packages that mix both state management and dependency injection, but these are two separate topics that should be approached differently. `stream_value` focuses solely on simplifying the use of `StreamController` for state management.

## Features

- Simplifies state management in Flutter
- Reduces boilerplate code
- Easy to use and learn

## Getting Started

To use `stream_value` in your project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  stream_value: ^0.0.1
```
  

Then, run flutter pub get to install the package.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

To use `stream_value`, first create an instance of the `StreamValue` class:

```dart
final addressStreamValue = StreamValue<YourClass?>(defaultValue: null);
```

This creates a StreamValue instance that holds a YourClass value that is initially set to null. You can update the value of addressStreamValue using the addValue() method:

```dart
addressStreamValue.addValue(YourClass());
```

To listen for changes to addressStreamValue, you can use the StreamValueBuilder widget:

```dart
StreamValueBuilder<YourClass?>(
  streamValue: addressStreamValue,
  builder: (context, value) {
    //value has YourClass? type
    //use the value to update your UI
  },
),
```

This will rebuild your widget whenever the value of addressStreamValue changes.

## Contributing

Contributions are welcome! But I really don't want to make it more complicated. So, we could improve, but we will not implement a lot of features so it grows out of the strict function we want for it.

## License

This package is licensed under the MIT license.

## Credits

This README file was written by ChatGPT on behalf of the `stream_value` package creator, who was unable to write it themselves due to time constraints.

