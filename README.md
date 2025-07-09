# 🚀 Stream Value

[![Pub Version](https://img.shields.io/pub/v/stream_value)](https://pub.dev/packages/stream_value)
[![License: MIT](https://img.shields.io/github/license/belluga/stream_value)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-flutter-blue)](https://flutter.dev)
[![Build](https://img.shields.io/badge/state%20management-stream--based-success)](https://pub.dev/packages/stream_value)

**Stream Value** is a simple and lightweight state management solution for Flutter that wraps `StreamController` and `StreamBuilder` to eliminate boilerplate.

Unlike other packages, `stream_value` is focused **purely on state**. It does **not** include dependency injection—staying true to the **single responsibility principle**.

---

## ✨ Features

- ✅ **Minimal Boilerplate** — Use streams with ease  
- 🎯 **Focused State Management** — No DI, just state  
- ⚡ **Lightweight & Simple** — Easy to learn and integrate  
- 🛡️ **Null-Safety by Default** — Handles nullable & non-nullable types  
- 🧩 **Built-in Error Handling** — Show error widgets with ease

---

## 🛠 Getting Started

### 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  stream_value: ^0.0.5  # Check for the latest version
```
Then run:
```
flutter pub get
```
---

## 💡 Usage
The package provides two main classes:

StreamValue<T> – holds and updates your state

StreamValueBuilder<T> – rebuilds the UI when state changes

## ✅ 1. Create a StreamValue
```
final nameStream = StreamValue<String?>(); // Nullable
final counterStream = StreamValue<int>(defaultValue: 0); // Non-nullable
```
## 🔄 2. Update the Value
```
void updateName(String newName) {
  nameStream.addValue(newName);
}

void incrementCounter() {
  final currentCount = counterStream.value;
  counterStream.addValue(currentCount + 1);
}

```
## 🧱 3. Build Your UI
```
class CounterPage extends StatelessWidget {
  final counterStream = StreamValue<int>(defaultValue: 0);

  CounterPage({super.key});

  void _increment() {
    counterStream.addValue(counterStream.value + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamValue Example')),
      body: Center(
        child: StreamValueBuilder<int>(
          streamValue: counterStream,
          builder: (context, value) {
            return Text(
              'You have pushed the button this many times: $value',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```
## ❗ Handling Null & Error States
```
StreamValueBuilder<User?>(
  streamValue: userStream,
  onNullWidget: const Center(child: CircularProgressIndicator()),
  onErrorBuilder: (error) => Center(child: Text('Error: $error')),
  builder: (context, user) {
    return Text('Hello, ${user.name}');
  },
),
```
## 🧪 Verified Source Details
### ✅ StreamValue<T> Class:
* Uses StreamController<T>.broadcast()

* Supports null safety and default values

* Provides .value and .error access

* Handles manual error injection via addError(...)

* .dispose() safely closes both controllers

### ✅ StreamValueBuilder<T> Widget:
* Rebuilds using StreamBuilder

* Supports:

* onNullWidget

* onErrorBuilder

* Default builder

* Works with nullable and non-nullable streams

## 🤝 Contributing
Contributions are welcome!
This package focuses on simplicity. Please keep PRs in line with the existing lightweight architecture.

* Fork it 🍴

* Create your feature branch 🚀

* Push & open a PR ✅

* Before adding a major feature, open an issue to discuss it.

## 📄 License
MIT License. See the LICENSE file for full details.

## 🔗 Links
[View on Pub.dev →](https://pub.dev/packages/stream_value)

[GitHub Repo →](https://github.com/belluga/stream_value)


# 
### Built with ❤️ to make Flutter state management intuitive