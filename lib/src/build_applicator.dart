import 'package:flutter_apply/flutter_apply.dart';
import 'package:flutter_apply_hooked/flutter_apply_hooked.dart';
import 'package:signal_wave/signal_wave.dart';

BuildApplicator<Wave<Applicator>, Applicator> buildApplicator = BuildApplicator((wave) {
  return apply((child) => $$ >> (context) => $(() => wave) > child);
});

class BuildApplicator<F, T> {
  T applyThis(F a) => _apply(a);

  final T Function(F) _apply;

  const BuildApplicator(this._apply);

  T operator >(F w) => applyThis(w);

  T call(F n) => applyThis(n);
}

