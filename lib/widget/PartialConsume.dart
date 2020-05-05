import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class PartialConsumeComponent<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget child;
  final ValueWidgetBuilder<T> builder;

  PartialConsumeComponent(
      {Key key, @required this.model, @required this.builder, this.child})
      : super(key: key);

  @override
  _PartialConsumewidgettate<T> createState() =>
      _PartialConsumewidgettate<T>();
}

class _PartialConsumewidgettate<T extends ChangeNotifier>
    extends State<PartialConsumeComponent<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
