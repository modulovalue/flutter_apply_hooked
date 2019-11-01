import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Applicator onHook(Widget Function(BuildContext, Widget) builder) {
  return apply((child) => $$ >> (context) => builder(context, child));
}

const _HookBuilder $$ = _HookBuilder();

class _HookBuilder {
  final Key key;

  const _HookBuilder({this.key});

  _HookBuilder call({Key key}) => _HookBuilder(key: key);

  Widget operator >>(Widget Function(BuildContext context) builder) =>
      HookBuilder(builder: (c) => builder(c), key: key);
}
