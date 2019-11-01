import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signal_wave/signal_wave.dart';

T $<T>(Wave<T> Function() wave, {List<Object> keys}) =>
    Hook.use(_WaveHook(keys, wave));

class _WaveHook<T> extends Hook<T> {
  final WaveType<T> Function() signal;

  const _WaveHook(List<Object> keys, this.signal) : super(keys: keys);

  @override
  _WaveHookState<T> createState() => _WaveHookState<T>();
}

class _WaveHookState<T> extends HookState<T, _WaveHook<T>> {
  Disposable disposable;

  WaveType<T> wave;

  @override
  T build(BuildContext context) => wave.value;

  @override
  void initHook() {
    super.initHook();
    wave = hook.signal();
    disposable?.cancel();
    disposable = wave.subscribe((T data) => setState(() {}));
  }

  @override
  void dispose() {
    disposable.cancel();
    super.dispose();
  }
}
