import 'dart:async';

class StreamValue<T> {
  final T defaultValue;

  StreamValue({required this.defaultValue});

  final StreamController<T> _streamController = StreamController<T>.broadcast();

  Stream<T> get stream => _streamController.stream;

  T? _value;
  T get value => _value ?? defaultValue;

  addValue(T newValue){
    _value = newValue;
    _streamController.add(value);
  }

  dispose(){
    _streamController.close();
  }
}
