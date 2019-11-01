import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

T useDispose<T>(T Function() value, void Function(T value) dispose,
    {List<Object> keys}) {
  final mem = useMemoized(() => value(), keys ?? []);
  useEffect(() => () => dispose(mem), keys ?? [""]);
  return mem;
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
