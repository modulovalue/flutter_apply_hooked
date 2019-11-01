import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Applicator onHook(Widget Function(BuildContext, Widget) builder) {
  return apply((child) => $$ >> (context) => builder(context, child));
}

T useDispose<T>(T Function() value, void Function(T value) dispose,
    {List<Object> keys}) {
  final mem = useMemoized(() => value(), keys ?? []);
  useEffect(() => () => dispose(mem), keys ?? [""]);
  return mem;
}

const _HookBuilder $$ = _HookBuilder();

class _HookBuilder {
  final Key key;

  const _HookBuilder({this.key});

  _HookBuilder call({Key key}) => _HookBuilder(key: key);

  Widget operator >>(Widget Function(BuildContext context) builder) =>
      HookBuilder(builder: (c) => builder(c), key: key);
}

ScrollController useScrollController(
    {ValueNotifier<double> scrollValue, void Function() onScrolled}) {
  return useDispose(() {
    final controller = ScrollController();
    if (scrollValue != null || onScrolled != null) {
      controller.addListener(() {
        if (onScrolled != null) {
          onScrolled();
        }
        if (scrollValue != null) {
          scrollValue.value =
              controller.offset / controller.position.maxScrollExtent;
        }
      });
    }
    return controller;
  }, (ScrollController a) => a.dispose());
}
