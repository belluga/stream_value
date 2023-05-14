import 'package:flutter/widgets.dart';
import 'package:stream_value/main.dart';

class StreamValueBuilder<T> extends StatelessWidget {
  final StreamValue<T?> streamValue;
  final Widget? onNullWidget;
  final Widget Function(String)? onErrorBuilder;
  final Widget Function(BuildContext, T) builder;

  const StreamValueBuilder({
    super.key,
    required this.streamValue,
    required this.builder,
    this.onNullWidget,
    this.onErrorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: streamValue.value,
      stream: streamValue.stream,
      builder: (context, snapshot) {
        final Widget? _onNullWidget = onNullWidget;

        final bool _showNullWidget =
            streamValue.value == null && _onNullWidget != null;

        if (_showNullWidget) {
          return _onNullWidget;
        }

        Widget Function(String)? _onErrorBuilder = onErrorBuilder;

        final String? _error = streamValue.error;
        final bool _showErrorWidget = _error != null && _onErrorBuilder != null;

        if (_showErrorWidget) {
          return _onErrorBuilder(_error);
        }
        return builder(context, streamValue.value as T);
      },
    );
  }
}
