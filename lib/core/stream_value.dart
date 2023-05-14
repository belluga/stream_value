import 'dart:async';

class StreamValue<T> {
  late T _defaultValue;

  StreamValue({T? defaultValue}) {
    try {
      _defaultValue = defaultValue as T;
    } catch (e) {
      throw Exception("if T is not-nullable, then default value is mandatory.");
    }
  }

  final _streamValueController = StreamController<T>.broadcast();
  final _streamErrorMessageController = StreamController<String?>.broadcast();

  Stream<T> get stream => _streamValueController.stream;

  T? _value;
  T get value => _value ?? _defaultValue;

  String? _error;
  String? get error => _error;

  void addValue(T? newValue) {
    _value = newValue;
    _streamValueController.add(value);
    _streamErrorMessageController.add(null);
  }

  void addError(String errorMessage) {
    _streamErrorMessageController.add(errorMessage);
  }

  void dispose() {
    _streamValueController.close();
    _streamErrorMessageController.close();
  }
}
