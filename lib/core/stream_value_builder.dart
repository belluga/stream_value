import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:stream_value/main.dart';

class StreamValueBuilder<T> extends StatelessWidget {
  final StreamValue<T> streamValue;
  final Widget Function(BuildContext, T) builder;

  const StreamValueBuilder({
    super.key,
    required this.streamValue,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: streamValue.value,
      stream: streamValue.stream,
      builder: (context, snapshot) => builder(context, streamValue.value),
    );
  }
}
