import 'package:flutter/material.dart';
import 'package:flutter_apply_hooked/flutter_apply_hooked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signal_wave/signal_wave.dart';

/// Take a value out of a wave and convert it to a widget.
///
/// Use useContext if context is needed
BuildWave<T> buildWave<T>(Wave<T> a) => BuildWave(a);

class BuildWave<T> {
  final Wave<T> wave;

  const BuildWave(this.wave);

  Widget operator >>(Widget Function(T) builder) =>
      HookBuilder(builder: (c) => builder($(() => wave)));
}
