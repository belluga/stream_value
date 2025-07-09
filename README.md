# **Stream Value**

A simple and lightweight state management solution for Flutter that wraps StreamController and StreamBuilder to reduce boilerplate code.

stream\_value is focused purely on state management. It is not a dependency injection package. While some solutions mix these two concepts, stream\_value believes they are separate concerns and provides a minimal, easy-to-use API for managing state with Streams.

## **Features**

* ✅ **Minimal Boilerplate**: Simplifies the use of StreamController and StreamBuilder.  
* focused **State Management**: Manages state without mixing in dependency injection.  
* 🚀 **Lightweight** & **Simple**: Easy to learn and integrate into any Flutter project.  
* 널 **Null-Safety by Default**: Handles nullable and non-nullable types gracefully.  
* ⚙️ **Built-in Error Handling**: Easily add and display errors in your UI.

## **Getting Started**

Add the package to your pubspec.yaml file:

dependencies:  
  stream\_value: ^0.0.5 \# Replace with the latest version

Then, run flutter pub get to install the package.

## **Usage**

The core of the package consists of two main classes: StreamValue\<T\> to hold and update the state, and StreamValueBuilder\<T\> to listen to changes and rebuild your UI.

### **1\. Create a StreamValue**

First, create an instance of StreamValue\<T\> in your state class or controller. This will hold the value of your state.

// For a nullable type, defaultValue is optional.  
final nameStream \= StreamValue\<String?\>();

// For a non-nullable type, defaultValue is required.  
final counterStream \= StreamValue\<int\>(defaultValue: 0);

### **2\. Update the Value**

Use the addValue() method to update the state. This will automatically notify all listeners.

void updateName(String newName) {  
  nameStream.addValue(newName);  
}

void incrementCounter() {  
  // Get the current value and add 1  
  final currentCount \= counterStream.value;  
  counterStream.addValue(currentCount \+ 1);  
}

### **3\. Build Your UI with StreamValueBuilder**

Wrap your widget with StreamValueBuilder to listen for state changes and automatically rebuild the UI.

import 'package:flutter/material.dart';  
import 'package:stream\_value/stream\_value.dart';

class CounterPage extends StatelessWidget {  
  final counterStream \= StreamValue\<int\>(defaultValue: 0);

  CounterPage({super.key});

  void \_increment() {  
    counterStream.addValue(counterStream.value \+ 1);  
  }

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(title: Text('StreamValue Example')),  
      body: Center(  
        // This widget will rebuild whenever the counter's value changes.  
        child: StreamValueBuilder\<int\>(  
          streamValue: counterStream,  
          builder: (context, value) {  
            // The \`value\` is the current state (e.g., 0, 1, 2...).  
            return Text(  
              'You have pushed the button this many times: $value',  
              style: Theme.of(context).textTheme.headlineMedium,  
            );  
          },  
        ),  
      ),  
      floatingActionButton: FloatingActionButton(  
        onPressed: \_increment,  
        tooltip: 'Increment',  
        child: const Icon(Icons.add),  
      ),  
    );  
  }  
}

### **Handling Null and Error States**

StreamValueBuilder also has optional parameters to handle null and error states gracefully.

StreamValueBuilder\<User?\>(  
  streamValue: userStream, // A StreamValue\<User?\>  
  // (Optional) Show a widget while the value is null  
  onNullWidget: const Center(child: CircularProgressIndicator()),  
  // (Optional) Show a widget when an error occurs  
  onErrorBuilder: (error) \=\> Center(child: Text('Error: $error')),  
  // This builder is only called when the value is not null and there is no error.  
  builder: (context, user) {  
    return Text('Hello, ${user.name}');  
  },  
),

## **Contributing**

Contributions are welcome\! This package aims to remain simple and focused on its core purpose. Therefore, contributions that improve the existing functionality, fix bugs, or enhance documentation are highly encouraged. New features that significantly increase the package's complexity may not be aligned with its philosophy.

Please feel free to open an issue to discuss any changes or report bugs.

## **License**

This package is licensed under the MIT License. See the LICENSE file for details.