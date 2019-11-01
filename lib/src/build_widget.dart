import 'package:flutter/material.dart';
import 'package:flutter_apply_hooked/flutter_apply_hooked.dart';
import 'package:signal_wave/signal_wave.dart';

/// De-waves a widget
Widget $widget(Wave<Widget> Function() wave, {List<Object> keys}) =>
    $$ >> (context) => $(wave, keys: keys);
